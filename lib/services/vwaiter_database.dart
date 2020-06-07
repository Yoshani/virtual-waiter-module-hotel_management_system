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


// }



//  Future<bool> checkConnection() async {
//     bool hasConnection;
// try {
//   await Firestore.instance
//     .runTransaction((Transaction tx) {})
//     .timeout(Duration(seconds: 5));
//   hasConnection = true;
// } on PlatformException catch(e) { // May be thrown on Airplane mode
//   hasConnection = false;
// } on TimeoutException catch(e) {
//   hasConnection = false;
// } catch (_) {
//   hasConnection = false;
// }
//     return hasConnection;
//   }

//  Future<bool> checkConnection() async {
//     bool hasConnection;
// int timeout = 5;
// try {
//   http.Response response = await http.get('someUrl').
//       timeout(Duration(seconds: timeout));
//   if (response.statusCode == 200) {
//     // do something
//   } else {
//     // handle it
//   }
// } on TimeoutException catch (e) {
//   print('Timeout Error: $e');
// } on SocketException catch (e) {
//   print('Socket Error: $e');
// } on Error catch (e) {
//   print('General Error: $e');
// }
//     return hasConnection;
//   }

// Future<bool> isInternet() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile) {
//       // I am connected to a mobile network, make sure there is actually a net connection.
//       if (await DataConnectionChecker().hasConnection) {
//         // Mobile data detected & internet connection confirmed.
//         return true;
//       } else {
//         // Mobile data detected but no internet connection found.
//         return false;
//       }
//     } else if (connectivityResult == ConnectivityResult.wifi) {
//       // I am connected to a WIFI network, make sure there is actually a net connection.
//       if (await DataConnectionChecker().hasConnection) {
//         // Wifi detected & internet connection confirmed.
//         return true;
//       } else {
//         // Wifi detected but no internet connection found.
//         return false;
//       }
//     } else {
//       // Neither mobile data or WIFI detected, not internet connection found.
//       return false;
//     }
//   }