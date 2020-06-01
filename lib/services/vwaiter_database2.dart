import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_management_system/models/vWaiter/offer.dart';
import 'package:hotel_management_system/models/vWaiter/order.dart';
import 'package:hotel_management_system/models/vWaiter/cartItem.dart';
import 'package:hotel_management_system/models/vWaiter/item.dart';
import 'package:hotel_management_system/models/vWaiter/menu.dart';
import 'package:hotel_management_system/models/vWaiter/restaurantTable.dart';
import 'package:hotel_management_system/screens/virtual_waiter/settings.dart';

class VWaiterDatabase2 {


  //collection reference
  final CollectionReference menuCollection = Firestore.instance.collection('main-menu');
  final CollectionReference itemCollection = Firestore.instance.collection('items');
  final CollectionReference tableCollection = Firestore.instance.collection('tables');
  final CollectionReference orderCollection = Firestore.instance.collection('orders');
  final CollectionReference reviewCollection = Firestore.instance.collection('reviews');
  final CollectionReference offerCollection = Firestore.instance.collection('special-offers');

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
    return tableCollection.orderBy('table_no').snapshots().map(tableListFromSnapshot);
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
  Future<bool> placeOrder(List<CartItem> cartItems, int seat, int subtotal, int total) async{

    await orderCollection.add({
      'seat': seat,
      'status': "placed",
      'subtotal': subtotal,
      'total': total,
      'dateTime': DateTime.now(),
      'table': tableCollection.document(Settings.table.tableId),
      'orderItems': toMap(cartItems),
      'staffInteract': {}
    });
    return true;
  }

  List toMap(List<CartItem> cartItems) {
    Map offerSoldList = {};
    List orderItems = [];
    for(CartItem cartItem in cartItems){
      if(cartItem.item is Item){
        orderItems.add ({
          'item': itemCollection.document(cartItem.item.itemId),
          'qty' : cartItem.quantity,
          'offer': null
        });
      }else{
        if (!offerSoldList.containsKey(cartItem.offer.offerid)){
          offerSoldList[cartItem.offer.offerid] = cartItem.offer.sold;
        }
        offerSoldList[cartItem.offer.offerid] = cartItem.quantity + offerSoldList[cartItem.offer.offerid];
        for(var offerItem in cartItem.offer.items){         
          orderItems.add({
            'item': offerItem['item'],
            'qty' : offerItem['quantity']*cartItem.quantity,
            'offer': cartItem.offer.name
          });                      
        }
      }
    } 
    offerSold(offerSoldList);
    return orderItems;
  }

  // update offer sold amount
  Future<void> offerSold(Map offerAmounts) async{
    for(var id in offerAmounts.keys){
      await offerCollection.document(id).updateData({
      'sold': offerAmounts[id]
    });
    }
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

  //get offers
  Stream<List<Offer>> get offers {
    return offerCollection.where('validTill', isGreaterThanOrEqualTo: DateTime.now()).snapshots().map(offerListFromSnapshot);
  }

  //offer list from snapshot
  List<Offer> offerListFromSnapshot (QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Offer(
        offerid: doc.documentID,
        items: doc.data['items'] ?? '',
        name: doc.data['name']  ?? '',
        price: doc.data['price'] ?? '',
        validTill: DateTime.parse(doc.data['validTill'].toDate().toString()) ?? '',
        sold: doc.data['sold'] ?? ''
      );      
    }).toList();
  }

  //get offer items
  Future<List<CartItem>> getOfferItems(List items) async{
    List<CartItem> offerItems=[];
    for (var item in items){
      var snap = await item['item'].get();
      Item offerItem=Item(
        itemId: snap.documentID,
        available: snap.data['available'] ?? '',
        name: snap.data['name'] ?? '',
        description: snap.data['description'] ?? '',
        persons: snap.data['persons'] ?? '',
        price: snap.data['price'] ?? '',
        category: snap.data['category'] ?? '',
        image: snap.data['image'] ?? ''
      );
      offerItems.add(
        CartItem(
          item: offerItem,
          quantity: item['quantity']
        )
      );
    }
    return offerItems;
  }  
}