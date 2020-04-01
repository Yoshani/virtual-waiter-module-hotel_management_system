import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hotel_management_system/models/orderManager/Order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderManagerDatabase {
  final int tableNo;
  OrderManagerDatabase({this.tableNo});
  //collection reference
  final CollectionReference orderCollection =
      Firestore.instance.collection('orders');

  final CollectionReference tableCollection =
      Firestore.instance.collection('tables');

//---------------------------------------------------------------------------------------------------------

//orders list from snapshot
  List<Order> _orderListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      // print(doc.documentID);

      return Order(
          status: doc.data['status'],
          total: doc.data['total'],
          datetime: doc.data['dateTime'],
          orderItems: doc.data['orderItems'],
          seat: doc.data['seat']);
      // table: doc.data['table']);
    }).toList();
  }

//get tablereference from tablecoolection
  Future<String> tableRef(int tableNo) async {
    String docRef = '';
    QuerySnapshot tableDocs = await tableCollection.getDocuments();
    tableDocs.documents.forEach((doc) {
      if (doc.data['table_no'] == tableNo) {
        docRef = doc.documentID;
      }
    });

    // print(docRef);
    return docRef;
  }

  List _orderCount(QuerySnapshot snapshot) {
    var map = Map();
    List<Order> orders;
    orders = _orderListFromSnapshot(snapshot);
    orders.forEach((element) {
      if (!map.containsKey(element.status)) {
        map[element.status] = 1;
      } else {
        map[element.status] += 1;
      }
    });
    return [orders, map];
  }

// get table data stream
  Stream<List> get orders async* {
    DocumentReference categoryDocRef;
    // datasnaps();
    await tableRef(tableNo).then((value) => {
          print(value),
          categoryDocRef = Firestore.instance
              .collection('tables')
              .document(value.toString()),
         
        });

    yield* orderCollection
        .where('table', isEqualTo: categoryDocRef)
        .snapshots()
        .map(_orderCount);
  }

//----------------------------------------------------------------------------------------------------------

//tablelist from snapshot

  List<Tables> _tableListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Tables(tableNo: doc.data['table_no']);
    }).toList();
  }

//get table stream
  Stream<List<Tables>> get tables {
    // datasnaps();
    return tableCollection.snapshots().map(_tableListFromSnapshot);
  }
}
