import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_management_system/models/kitchen/KitchenData.dart';

class KitchenDatabase {


  
  //collection reference
  final CollectionReference categoryCollection =Firestore.instance.collection('test');

  // Future updateMenuData() async {
  //   return await categoryCollection
  //       .document('fried-rice')
  //       .setData({'sugars': sugars, 'name': name, 'strength': strength});
  // }

//item list from snapshot

List<ItemData> _itemListFromSnapshot(QuerySnapshot snapshot){
  print("snaps");
  // print(snapshot.documents[0].data['description']);
  return snapshot.documents.map((doc){
    return ItemData(
      description: doc.data['description'] ?? '',
      price: doc.data['price'] ,
      available: doc.data['available'] 
    );
    
  }).toList();
}


//get Item data 
  Future<List<ItemData>> getItemData() async {
    try {
      QuerySnapshot snapshot = await categoryCollection.getDocuments();
      
      return _itemListFromSnapshot(snapshot);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }




}
