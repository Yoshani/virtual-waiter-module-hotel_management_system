// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hotel_management_system/models/kitchen/item.dart';
// import 'package:hotel_management_system/models/kitchen/menu.dart';
// import 'package:hotel_management_system/models/kitchen/menuItem.dart';

// class VWaiterDatabase3 {

//   //collection reference
//   final CollectionReference menuCollection =Firestore.instance.collection('main-menu');
//   final CollectionReference itemCollection =Firestore.instance.collection('items');

//   // get menu list stream
//   // Stream<List<Menu>> get menu {
//   //   return menuCollection.snapshots().asyncMap(menuListFromSnapshot);
//   // }

//   //menu list from snapshot
//   Stream<List<Menu>> getItem() {
//   return menuCollection.snapshots().asyncMap((snapshot) async {
//     print (snapshot);
//     List<Menu> menuy = [];
//     snapshot.documents.forEach((doc) async {

//       print(doc.data['category']);
//       List menuItems = doc.data['menuItems'];
//       List<Item> items = [];

//         for (var menuItem in menuItems) {
//           // DocumentReference itemRef = menuItem['item'];
//           print(menuItem['item'].documentID);
//           var document = menuItem['item'];
//           // var document = itemCollection.document(menuItem['item'].documentID);
          
//           // print (itemRef);
//           // var type = menuItem['type'];

//           var snap = await document.get();
//           print(snap.data['name']);
          
//           if(snap.exists && snap.data['available']){
//             items.add(Item(
//             available: snap.data['available'] ?? '',
//             name: snap.data['name'] ?? '',
//             description: snap.data['description'] ?? '',
//             persons: snap.data['persons'] ?? '',
//             price: snap.data['price'] ?? ''
//             ));
//           }else{
//             print("No data");
//           }
//           // MenuItem menuItemDetails = MenuItem(
//           //   type: menuItem['type']
//           // );
//         } 
//         menuy.add (Menu(
//           category: doc.data['category'] ?? '',
//           menuItems: items ?? ''
//         )); 
        
      
//     });
    
//     return menuy;
//   });
//   }

//   // Stream<List<Menu>> menuList(){
//   //   return menuCollection.snapshots().asyncMap((snapshot) {
//   //     return snapshot.asyncMap((doc) async {

//   //       List menuItems = doc.data['menuItems'];
//   //       List<Item> items = [];

//   //       for (var menuItem in menuItems) {
//   //         // DocumentReference itemRef = menuItem['item'];
//   //         print(menuItem['item'].documentID);
//   //         var document = menuItem['item'];
//   //         // var document = itemCollection.document(menuItem['item'].documentID);
          
//   //         print(doc.data['category']);
//   //         // print (itemRef);
//   //         // var type = menuItem['type'];

//   //         var snap = await document.get();
//   //         print(snap.data['name']);
          
//   //         if(snap.exists && snap.data['available']){
//   //           items.add(Item(
//   //           available: snap.data['available'] ?? '',
//   //           name: snap.data['name'] ?? '',
//   //           description: snap.data['description'] ?? '',
//   //           persons: snap.data['persons'] ?? '',
//   //           price: snap.data['price'] ?? ''
//   //           ));
//   //         }else{
//   //           print("No data");
//   //         }
//   //         // MenuItem menuItemDetails = MenuItem(
//   //         //   type: menuItem['type']
//   //         // );
//   //       }
//   //       return Menu(
//   //         category: doc.data['category'] ?? '',
//   //         menuItems: items ?? ''
//   //       ); 
//   //     }).toList();
//   //   });
//   // }

// //  firestore.collection('users').document(userId).snapshots().asyncMap((snap) async {
// //       List<String> groceryListsArr = snap.data['groceryLists'];
// //       var groceryList = <DocumentSnapshot>[];
// //       for (var groceryPath in groceryListsArr) {
// //         groceryList.add(await firestore.document(groceryPath).get());
// //       }
// //       return groceryList;
// //     });


//   // get menu list stream
//   // Stream<List<Menu>> getItem() {
//   //   return menuCollection.snapshots().asyncMap(menuListFromSnapshot);
//   // }

//   // //menu list from snapshot
//   // Future<List<Menu>> menuListFromSnapshot (QuerySnapshot snapshot) async{
//   //   var documents = snapshot.documents;
//   //   List menu = [];
//   //   documents.forEach((doc) async {
//   //     print(doc.data['category']);
//   //     List menuItems = doc.data['menuItems'];
//   //     List<Item> items = [];

//   //       for (var menuItem in menuItems) {
//   //         // DocumentReference itemRef = menuItem['item'];
//   //         print(menuItem['item'].documentID);
//   //         var document = menuItem['item'];
//   //         // var document = itemCollection.document(menuItem['item'].documentID);
          
//   //         // print (itemRef);
//   //         // var type = menuItem['type'];

//   //         var snap = await document.get();
//   //         print(snap.data['name']);
          
//   //         if(snap.exists && snap.data['available']){
//   //           items.add(Item(
//   //           available: snap.data['available'] ?? '',
//   //           name: snap.data['name'] ?? '',
//   //           description: snap.data['description'] ?? '',
//   //           persons: snap.data['persons'] ?? '',
//   //           price: snap.data['price'] ?? ''
//   //           ));
//   //         }else{
//   //           print("No data");
//   //         }
//   //       }
//   //     menu.add(Menu(
//   //       category: doc.data['category'] ?? '',
//   //       menuItems: items ?? ''
//   //     )); 
//   //     print("sssssssssssss");     
//   //   });
//   //   print("aaaaaaaaaaaaa");
//   //   return menu;
//   // }

 







// }