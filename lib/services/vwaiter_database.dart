import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_management_system/models/kitchen/menuItem.dart';

class VWaiterDatabase {
  
  //collection reference
  final CollectionReference menuCollection =Firestore.instance.collection('my-menu');

//menu list from snapshot
List<MenuItem> _menuListFromSnapshot(QuerySnapshot snapshot){
  // print("snaps");

  return snapshot.documents.map((doc){
    // print (doc.data['name']);
    return MenuItem(
      name: doc.data['name'] ?? '',
    );
  }).toList();
}

  // get menu list stream
  Stream<List<MenuItem>> get menuItems {
    return menuCollection.snapshots()
      .map(_menuListFromSnapshot);
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
