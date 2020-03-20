import 'package:hotel_management_system/models/user/user.dart';
import 'package:hotel_management_system/screens/authenticate/authenticate.dart';
import 'package:hotel_management_system/screens/kitchen/kitchen.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/screens/manager/manager.dart';
import 'package:hotel_management_system/screens/order_manager/order_manager_home.dart';
import 'package:hotel_management_system/screens/virtual_waiter/vwaiter_home.dart';
import 'package:hotel_management_system/services/database.dart';
import 'package:provider/provider.dart';

import '../models/user/user.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Future<UserData> getUserType(User user) async {
    UserData userData = await DatabaseService(uid: user.uid).getUserData();
    // print(userdata.type);
    return userData;
  }

  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      Authenticate();
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return FutureBuilder(
        future: getUserType(user),
        builder: (context, userdata) {
          Widget widgt;
          if (userdata.connectionState == ConnectionState.done) {
            print(userdata.data.type);
            if (userdata.data.type == "Vwaiter") {
              widgt = VwaiterHome();
            } else if (userdata.data.type == "Order Manager") {
              widgt = OrderManagerHome();
            } else if (userdata.data.type == "Manager") {
              widgt = Manager();
            } else if (userdata.data.type == "Chef") {
              widgt = Kitchen();
            }
          } else {
            widgt = Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return widgt;
        },
      );
    }
  }
}
