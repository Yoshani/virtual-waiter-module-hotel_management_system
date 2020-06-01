import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DocumentSnapshotMock extends Mock implements DocumentSnapshot {
  final String documentID;
  final Map<String, dynamic> data;

  DocumentSnapshotMock(this.documentID, this.data);
}

void main(){
  test('documentSnapshot', () {
      final data = {"email": "email"};
      final documentSnapshotMock = DocumentSnapshotMock("uid", data);

      expect(data['email'], documentSnapshotMock.data['email']);
      expect("uid", documentSnapshotMock.documentID);
  });
}