// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hotel_management_system/models/kitchen/item.dart';
// import 'package:hotel_management_system/models/kitchen/menu.dart';
// import 'package:hotel_management_system/models/kitchen/menuItem.dart';


// class VWaiterDatabase {

//   String item_id;
  
//   //collection reference
//   final CollectionReference menuCollection =Firestore.instance.collection('main-menu');
//   final CollectionReference itemCollection =Firestore.instance.collection('items');


// // document.get() => then(function(document) {
// //     print(document('name'));
// //  print(DocumentSnapshot.data['name'].toString())
// //item from snapshot

//   // item data from snapshots
//   Item _itemFromSnapshot(DocumentSnapshot snapshot) {
//     print(snapshot.data['name'] ?? 'no');
//     return Item(
//       available: snapshot.data['available'] ?? '',
//       name: snapshot.data['name'] ?? '',
//       description: snapshot.data['description'] ?? '',
//       persons: snapshot.data['persons'] ?? '',
//       price: snapshot.data['price'] ?? ''
//     );
//   }

//   // get item doc stream
//   Stream<Item> get getitem {
//     return itemCollection.document(item_id).snapshots().map(_itemFromSnapshot);
//   }

//   //   Future<void> _itemData(String item_id) async {
//   //   return await itemCollection.document(item_id).get().then((DocumentSnapshot snap){
//   //          print(snap.data['name']);
//   //       });
//   // }
// // Item _itemFromSnapshot (String id){
// //   Item item;
// //   itemCollection.document(id).get().then((DocumentSnapshot) {
// //     item = Item(
// //       available: DocumentSnapshot.data['available'] ?? '',
// //       name: DocumentSnapshot.data['name'] ?? '',
// //       description: DocumentSnapshot.data['description'] ?? '',
// //       persons: DocumentSnapshot.data['persons'] ?? '',
// //       price: DocumentSnapshot.data['price'] ?? ''
// //     );
// //   });
// //   return item;
// // }

// // itemCollection.document(userId).snapshots().asyncMap((snap) async {
// //       List<String> groceryListsArr = snap.data['groceryLists'];
// //       var groceryList = <DocumentSnapshot>[];
// //       for (var groceryPath in groceryListsArr) {
// //         groceryList.add(await firestore.document(groceryPath).get());
// //       }
// //       return groceryList;
// //     });
// Future<Item> _itemData(DocumentReference docRef) async{
//   DocumentSnapshot snap= await docRef.get(); 
  
//     Item item = Item(
//       available: snap.data['available'] ?? '',
//       name: snap.data['name'] ?? '',
//       description: snap.data['description'] ?? '',
//       persons: snap.data['persons'] ?? '',
//       price: snap.data['price'] ?? ''
//     );
//   return item;
// }

// // Item methodAsync(DocumentReference docRef) async{
// //   Item value = await _itemData(docRef);
// //   // do something with value
// //   return value;
// // }

// //menu list from snapshot
//   List<Menu> _menuListFromSnapshot (QuerySnapshot snapshot) {
//     return snapshot.documents.map((doc){
//       List<MenuItem> menuItems = new List<MenuItem>();
//       for(int i=0; i<doc.data['menuItems'].length; i++) {
//         print(i);

        
        
//         // doc.data['menuItems'][i]['item']
//         // .get().then((DocumentSnapshot) {
//         //    print(DocumentSnapshot.data['name']);
//         // });

//         // print(itemCollection.document((doc.data['menuItems'][i]['item']).documentID).snapshots().data['available'] );
//           // item_id=doc.data['menuItems'][i]['item'].documentID;
//           // _itemData(doc.data['menuItems'][i]['item'].documentID);
 
//           menuItems.add(
//             MenuItem(
//               type: doc.data['menuItems'][i]['type'],
              
//               item: _itemData(doc.data['menuItems'][i]['item']),
//               // item: itemCollection.document((doc.data['menuItems'][i]['item']).documentID).snapshots().map(_itemFromSnapshot)
              
//               // item: _itemFromSnapshot((doc.data['menuItems'][i]['item']).get()),  
//               // item: doc.data['menuItems'][i]['item'].snapshots().map(_itemFromSnapshot)
//             )
//           );
//       }
//       // print(doc.data['menuItems']);
//       return Menu(
//         category: doc.data['category'] ?? '',
//         menuItems: menuItems ?? ''
//       );
      
//     }).toList();
//   }

//   // get menu list stream
//   Stream<List<Menu>> get menu {
//     return menuCollection.snapshots().map(_menuListFromSnapshot);
//   }

//   // Stream<Item> get items {

//   // }



// // //get Menu data 
// //   Future<List<MenuItem>> getItemData() async {
// //     try {
// //       QuerySnapshot snapshot = await menuCollection.getDocuments();
      
// //       return _menuListFromSnapshot(snapshot);
// //     } catch (e) {
// //       print(e.toString());
// //       return null;
// //     }
// //   }



// // MastersList() async
// // {
// //      List list_of_masters = await                                   Firestore.instance.collection("masters")
// //     .getDocuments()
// //     .then((val) => val.documents);
// // for (int i=0; i<list_of_masters.length; i++)
// //     {
// //          Firestore.instance.collection("masters").document(
// //       list_of_masters[i].documentID.toString()).collection("courses").snapshots().listen(CreateListofCourses);
// //      }
// // }




// }
