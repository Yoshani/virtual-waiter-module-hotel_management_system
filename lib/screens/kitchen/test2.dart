import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/kitchen/KitchenData.dart';
import 'package:hotel_management_system/services/kitchen_database.dart';
import 'package:hotel_management_system/screens/kitchen/foodItemList.dart';

class Test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          centerTitle: true,
          title: Text('test2'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/kitchen/coffee.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(color: Colors.black.withOpacity(0)),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/kitchen/coffee.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
            //  child: Stack(children: <Widget>[
            //     Container(
            //       decoration: BoxDecoration(
            //         image: DecorationImage(
            //             image: AssetImage('assets/kitchen/coffee.jpg')),
            //       ),
            //     ),
            //     // BackdropFilter(
            //     //   filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            //     //   child: Container(color: Colors.black.withOpacity(0)),
            //     // ),
            //   ])
          ),
        ));
  }
}
