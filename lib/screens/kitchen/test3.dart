import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/kitchen/KitchenData.dart';
import 'package:hotel_management_system/services/kitchen_database.dart';
import 'package:hotel_management_system/screens/kitchen/foodItemList.dart';

class Test3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          centerTitle: true,
          title: Text('test3'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
        ),
        body: Container(
            // height: 800,
            // width: 500,

            // <-- clips to the 200x200 [Container] below

            // child: Stack(children: <Widget>[
            //   Container(
            //     width: 300,
            //     height: 300,
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //         image: AssetImage('assets/kitchen/coffee.jpg'),
            //       ),
            //     ),
            //   ),
            //   ClipRect(
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       children: <Widget>[
            //         Container(height: 100,width: 100,
            //         color: Colors.red),

            //         BackdropFilter(
            //             filter: ImageFilter.blur(
            //               sigmaX: 5.0,
            //               sigmaY: 5.0,
            //             ),
            //             child: Container(
            //               alignment: Alignment.center,
            //               width: 200.0,
            //               height: 200.0,
            //               // decoration: BoxDecoration(
            //               //   image: DecorationImage(
            //               //     image: AssetImage('assets/kitchen/coffee.jpg'),
            //               //   ),
            //               // ),
            //               child: Text('Hello World'),
            //             )),
            //       ],
            //     ),
            //   ),
            // ]),

            child: Stack(
          children: <Widget>[
            Container(
              width: 800,
              height: 800,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/kitchen/coffee.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 300,
              width: 300,
              // color: Colors.amber,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'assets/kitchen/friedrice.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                 
                    ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5.0,
                            sigmaY: 5.0,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            // width: 250.0,
                            // height: 190.0,
                            // decoration: BoxDecoration(
                            //   image: DecorationImage(
                            //     image: AssetImage('assets/kitchen/pizza-1.jpg'),
                            //   ),
                            // ),
                            child: Text('Hello Worlld'),
                          )),
                    ),
                  
                  // Stack(
                  //   children: <Widget>[
                  //     // Image.asset(
                  //     //   'assets/kitchen/salad.jpg',
                  //     //   fit: BoxFit.fill,
                  //     // ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        )));
  }
}
