import 'package:hotel_management_system/models/user.dart';
import 'package:hotel_management_system/screens/authenticate/authenticate.dart';
import 'package:hotel_management_system/screens/virtual_waiter/vwaiter_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    
    // return either the VWaiter Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return VwaiterHome();
    }
    
  }
}