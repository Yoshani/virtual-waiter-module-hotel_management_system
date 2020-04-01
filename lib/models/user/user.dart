class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String email;

  final String type;

  UserData({this.uid, this.email, this.name, this.type});
}
