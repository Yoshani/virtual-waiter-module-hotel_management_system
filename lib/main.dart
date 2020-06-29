import 'package:hotel_management_system/models/user.dart';
import 'package:hotel_management_system/screens/virtual_waiter/cart.dart';
import 'package:hotel_management_system/screens/virtual_waiter/feedback.dart';
import 'package:hotel_management_system/screens/virtual_waiter/order_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_management_system/screens/wrapper.dart';
import 'package:hotel_management_system/services/auth.dart';
import 'package:hotel_management_system/shared/order_placed_loading.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    ]);
    
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: GestureDetector(
        onTap: () {
          SystemChrome.setEnabledSystemUIOverlays ([]);
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
          routes: {
            '/cart': (context) => Cart(),
            '/orderStatus': (context) => OrderStatus(),
            '/feedback': (context) => CustomerFeedback(),
            '/orderloading': (context) => OrderLoading(),
          },
        ),
      ),
    );
       
  }
}
