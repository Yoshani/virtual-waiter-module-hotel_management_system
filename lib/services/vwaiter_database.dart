import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_management_system/models/kitchen/item.dart';
import 'package:hotel_management_system/models/kitchen/menu.dart';
import 'package:hotel_management_system/models/kitchen/menuItem.dart';

class VWaiterDatabase {
  
  //collection reference
  final CollectionReference menuCollection =Firestore.instance.collection('main-menu');

//item from snapshot
Item _itemFromSnapshot (DocumentSnapshot docSnap){
  print(docSnap.data['name']);
  return Item(
    available: docSnap.data['available'],
    name: docSnap.data['name'],
    description: docSnap.data['description'],
    persons: docSnap.data['persons'],
    price: docSnap.data['price']
  );
}

// firestore.collection('users').document(userId).snapshots().asyncMap((snap) async {
//       List<String> groceryListsArr = snap.data['groceryLists'];
//       var groceryList = <DocumentSnapshot>[];
//       for (var groceryPath in groceryListsArr) {
//         groceryList.add(await firestore.document(groceryPath).get());
//       }
//       return groceryList;
//     });

//menu list from snapshot
  List<Menu> _menuListFromSnapshot (QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      List<MenuItem> menuItems = new List<MenuItem>();
      for(int i=0; i<doc.data['menuItems'].length; i++){
        print(i);
        print((doc.data['menuItems'][i]['item']).snapshots().map(_itemFromSnapshot));
          menuItems.add(
            MenuItem(
              type: doc.data['menuItems'][i]['type'],

              
              // item: _itemFromSnapshot((doc.data['menuItems'][i]['item']).get()),  
              // item: doc.data['menuItems'][i]['item'].snapshots().map(_itemFromSnapshot)
            )
          );
      }
      print(doc.data['menuItems']);
      return Menu(
        category: doc.data['category'] ?? '',
        menuItems: menuItems ?? ''
      );
      
    }).toList();
  }

  // get menu list stream
  Stream<List<Menu>> get menu {
    print(menuCollection.snapshots().map(_menuListFromSnapshot));
    return menuCollection.snapshots().map(_menuListFromSnapshot);
  }



// //get Menu data 
//   Future<List<MenuItem>> getItemData() async {
//     try {
//       QuerySnapshot snapshot = await menuCollection.getDocuments();
      
//       return _menuListFromSnapshot(snapshot);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }



// MastersList() async
// {
//      List list_of_masters = await                                   Firestore.instance.collection("masters")
//     .getDocuments()
//     .then((val) => val.documents);
// for (int i=0; i<list_of_masters.length; i++)
//     {
//          Firestore.instance.collection("masters").document(
//       list_of_masters[i].documentID.toString()).collection("courses").snapshots().listen(CreateListofCourses);
//      }
// }




}
