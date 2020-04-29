import 'package:hotel_management_system/screens/virtual_waiter/cart.dart';
import 'package:hotel_management_system/screens/virtual_waiter/feedback.dart';
import 'package:hotel_management_system/screens/virtual_waiter/order_status.dart';
import 'package:hotel_management_system/screens/virtual_waiter/vwaiter_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    ]);
    
    return GestureDetector(
      onTap: () {
        SystemChrome.setEnabledSystemUIOverlays ([]);
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: VwaiterHome(),
        routes: {
          '/cart': (context) => Cart(),
          '/orderStatus': (context) => OrderStatus(),
          '/feedback': (context) => CustomerFeedback(),
        },
      ),
    );   
  }
}
