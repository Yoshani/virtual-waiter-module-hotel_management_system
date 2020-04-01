import 'package:flutter/foundation.dart';
import 'package:hotel_management_system/models/user/user.dart';
import 'package:hotel_management_system/screens/authenticate/authenticate.dart';
import 'package:hotel_management_system/screens/kitchen/edit_menu.dart';
import 'package:hotel_management_system/screens/kitchen/kitchen.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/screens/kitchen/test.dart';
import 'package:hotel_management_system/screens/kitchen/test2.dart';
import 'package:hotel_management_system/screens/kitchen/test3.dart';
import 'package:hotel_management_system/screens/manager/manager.dart';
import 'package:hotel_management_system/screens/order_manager/order_manager_home.dart';
import 'package:hotel_management_system/screens/virtual_waiter/vwaiter_home.dart';
import 'package:hotel_management_system/services/database.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Widget widgt;

  getUserType(User user) async {
    UserData userdata = await DatabaseService(uid: user.uid).getUserData();
    // print(userdata.type);
    if (userdata.type == "Vwaiter") {
      setState(() {
        widgt = VwaiterHome();
      });
    } else if (userdata.type == "Order Manager") {
      setState(() {
        widgt = OrderManagerHome();
      });
    } else if (userdata.type == "Manager") {
      setState(() {
        widgt = Manager();
      });
    } else if (userdata.type == "Chef") {
      setState(() {
        widgt = Test();
      });
    }
  }

  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null)
      return Authenticate();
    else
      getUserType(user);
    return widgt;
  }
}
