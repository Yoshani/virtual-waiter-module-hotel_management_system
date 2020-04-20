import 'package:hotel_management_system/models/user/user.dart';
import 'package:hotel_management_system/screens/kitchen/kitchen.dart';
import 'package:hotel_management_system/screens/kitchen/test.dart';
import 'package:hotel_management_system/screens/virtual_waiter/feedback.dart';
import 'package:hotel_management_system/screens/virtual_waiter/order_status.dart';
import 'package:hotel_management_system/screens/wrapper.dart';
import 'package:hotel_management_system/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    ]);
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        routes: {
          '/orderStatus': (context) => OrderStatus(),
          '/feedback': (context) => CustomerFeedback(),
        },
      ),
    );
   
  }
}
