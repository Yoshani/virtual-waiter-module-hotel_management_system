import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hotel_management_system/models/vWaiter/order.dart';
import 'package:hotel_management_system/models/vWaiter/cartItem.dart';
import 'package:hotel_management_system/models/vWaiter/item.dart';
import 'package:hotel_management_system/models/vWaiter/menu.dart';
import 'package:hotel_management_system/models/vWaiter/restaurantTable.dart';
import 'package:hotel_management_system/screens/virtual_waiter/settings.dart';

class VWaiterDatabase2 {


  //collection reference
  final CollectionReference menuCollection =Firestore.instance.collection('main-menu');
  final CollectionReference itemCollection =Firestore.instance.collection('items');
  final CollectionReference tableCollection =Firestore.instance.collection('tables');
  final CollectionReference orderCollection =Firestore.instance.collection('orders');
  final CollectionReference reviewCollection =Firestore.instance.collection('reviews');

  // get menu list stream
  Stream<List<Menu>> get menu {
    return menuCollection.snapshots().map(menuListFromSnapshot);
  }

  //menu list from snapshot
  List<Menu> menuListFromSnapshot (QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Menu(
        category: doc.data['category'] ?? '',
        menuItems: doc.data['menuItems']  ?? '',
        image: doc.data['image'] ?? ''
      );      
    }).toList();
  }

  // Future getImageURL(String imageName) async{
  //   final ref = FirebaseStorage.instance.ref().child(imageName);
  //   return await ref.getDownloadURL();
  // }


  //get item stream
  Stream<List<Item>> getItemList(String category) {
    return itemCollection.where('category', isEqualTo: category).where('available', isEqualTo: true).snapshots().map(itemListFromSnapshot);
  }

  List<Item> itemListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((snap){
      return Item(
        itemId: snap.documentID,
        available: snap.data['available'] ?? '',
        name: snap.data['name'] ?? '',
        description: snap.data['description'] ?? '',
        persons: snap.data['persons'] ?? '',
        price: snap.data['price'] ?? '',
        category: snap.data['category'] ?? '',
        image: snap.data['image'] ?? ''
      );
    }).toList();
  }

  // get table list stream
  Stream<List<RestaurantTable>> get tables {
    return tableCollection.snapshots().map(tableListFromSnapshot);
  }

  //table list from snapshot
  List<RestaurantTable> tableListFromSnapshot (QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return RestaurantTable(
        tableId: doc.documentID,
        tableNo: doc.data['table_no'] ?? '',
        seats: doc.data['no_of_seats']  ?? '',
      );      
    }).toList();
  }

  //place order
  Future<void> placeOrder(List<CartItem> cartItems, int seat, int subtotal, int total) async{
    await orderCollection.add({
      'seat': seat,
      'status': "placed",
      'subtotal': subtotal,
      'total': total,
      'dateTime': DateTime.now(),
      'table': tableCollection.document(Settings.table.tableId),
      'orderItems': cartItems.map((cartItem) => toMap(cartItem)).toList()
    });
  }

  Map<String, dynamic> toMap(CartItem cartItem) {
    return {
      'item': itemCollection.document(cartItem.item.itemId),
      'qty' : cartItem.quantity
    };
  }

  //order status
   Stream<List<Order>> getOrderList() {
    DocumentReference tableRef = tableCollection.document(Settings.table.tableId);
    return orderCollection.where('table', isEqualTo: tableRef).where('status', whereIn: ["placed", "confirmed","cooking","cooked","served"]).snapshots().map(orderListFromSnapshot);
  }

  List<Order> orderListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((snap){
      return Order(
        orderId: snap.documentID,
        status: snap.data['status'] ?? '',
        seat: snap.data['seat'] ?? '',
      );
    }).toList();
  } 

  //finish order
  Future<void> finishOrder(Order order) async{
    return await orderCollection.document(order.orderId).updateData({
      'status': "finished"
    });
  }

  //submit feedback
  Future<void> submitFeedback(String name, String feedback, double rating) async{
    await reviewCollection.add({     
      'date': DateTime.now(),
      'feedback': feedback,
      'name': name,
      'stars': rating,
    });
  }



  // Future<void> updateUserData(String sugars, String name, int strength) async {
  //   return await brewCollection.document(uid).setData({
  //     'sugars': sugars,
  //     'name': name,
  //     'strength': strength,
  //   });
  // }

  // Future<List<RestaurantTable>> get restaurantTables async {
  //   QuerySnapshot snapshot= await tableCollection.getDocuments();
  //   return tableListFromSnapshot(snapshot);   
  // }



  // Stream<List<Item>> asStream(Menu menu) => new Stream.fromFuture(itemListFromMenu(menu));

  // //get items list
  // Future<List<Item>> itemListFromMenu(Menu menu) async{
  //   List<Item> items = [];

  //   for (var menuItem in menu.menuItems) {
  //     // DocumentReference itemRef = menuItem['item'];
  //     print(menuItem['item'].documentID);
  //     var document = menuItem['item'];
  //     // var document = itemCollection.document(menuItem['item'].documentID);
      
  //     print(menu.category);
  //     // print (itemRef);
  //     // var type = menuItem['type'];

  //     var snap = await document.get();

  //     print(snap.data['name']);
  //     final ref = FirebaseStorage.instance.ref().child(snap.data['image']);
  //     var image = await ref.getDownloadURL();
  //     if(snap.exists && snap.data['available']){
  //       items.add(Item(
  //       available: snap.data['available'] ?? '',
  //       name: snap.data['name'] ?? '',
  //       description: snap.data['description'] ?? '',
  //       persons: snap.data['persons'] ?? '',
  //       price: snap.data['price'] ?? '',
  //       image: image ?? ''
  //       ));
  //     }else{
  //       print("No data");
  //     }
  //   }

  //   return items;
  // }


//   Future<Widget> _getImage(BuildContext context, String image) async {
//   Image m;
//   await FireStorageService.loadImage(context, image).then((downloadUrl) {
//     m = Image.network(
//       downloadUrl.toString(),
//       fit: BoxFit.scaleDown,
//     );
//   });
// return m;
// }

//---------------------------------------

// Stream getItems(Menu menu) async*
// {
//   menu.menuItems.forEach((menuItem) async* {
//      yield* itemCollection
//       .document(menuItem['item'].documentID)
//       .snapshots()
//       .map(_getItem);
//   });

// }

// Item _getItem(DocumentSnapshot snap){
//   Item item;
//   if(snap.data['available']){
//   item = Item(
//         available: snap.data['available'] ?? '',
//         name: snap.data['name'] ?? '',
//         description: snap.data['description'] ?? '',
//         persons: snap.data['persons'] ?? '',
//         price: snap.data['price'] ?? ''
//         );
//   }
//   return item;
// }



}