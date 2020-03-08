import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hotel_management_system/models/user/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference userDataCollection =
      Firestore.instance.collection('userData');

  Future updateUserData(String name, String type) async {
    return await userDataCollection
        .document(uid)
        .setData({'name': name, 'type': type});
  }

//return user data from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    print('snapshot');
    print(snapshot.data['name']);

    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      email: snapshot.data['email'],
      type: snapshot.data['type'],
    );
  }

//get user data who logs in to the system
  Future<UserData> getUserData() async {
    try {
      DocumentSnapshot snapshot = await userDataCollection.document(uid).get();
      
      return _userDataFromSnapshot(snapshot);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
