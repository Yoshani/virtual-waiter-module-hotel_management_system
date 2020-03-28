import 'dart:ui';

import 'package:hotel_management_system/screens/kitchen/edit_menu.dart';
import 'package:hotel_management_system/models/kitchen/KitchenData.dart';
import 'package:hotel_management_system/services/kitchen_database.dart';
import 'package:hotel_management_system/screens/kitchen/foodItemList.dart';
import 'package:hotel_management_system/services/auth.dart';
import 'package:flutter/material.dart';




class Kitchen extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Kitchen',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1.5,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: Container(
        child: ListView(children: [
          SizedBox(height: 30.0),
          Column(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 200,
                      width: 300,
                      child: Card(
                        elevation: 15,
                        child: InkWell(
                          onTap: () async {
                            List<ItemData> menuItems =
                                await KitchenDatabase().getItemData();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FoodItemList(menuItems)));
                          },
                          child: Image.asset(
                            'assets/kitchen/friedrice.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  Text("12"),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Center(
            child: Container(
              height: 200,
              width: 300,
              child: Card(
                elevation: 15,

                child: InkWell(
                  onTap: () {
                    print('1556');
                  },
                  child: Image.asset(
                    'assets/kitchen/rice-and-curry.jfif',
                    fit: BoxFit.cover,
                  ),
                ),
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(10.0),
                // ),
                margin: EdgeInsets.all(10),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Container(
              height: 200,
              width: 300,
              child: Card(
                elevation: 15,

                child: InkWell(
                  onTap: () {
                    print('1556');
                  },
                  child: Image.asset(
                    'assets/kitchen/pizza.jfif',
                    fit: BoxFit.cover,
                  ),
                ),
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(10.0),
                // ),
                margin: EdgeInsets.all(10),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 200,
              width: 300,
              child: Card(
                elevation: 15,

                child: InkWell(
                  onTap: () {
                    print('1556');
                  },
                  child: Image.asset(
                    'assets/kitchen/coffee.jfif',
                    fit: BoxFit.cover,
                  ),
                ),
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(10.0),
                // ),
                margin: EdgeInsets.all(10),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 200,
              width: 300,
              child: Card(
                elevation: 15,
                child: InkWell(
                    onTap: () {
                      print('1556');
                    },
                    child: Container(
                      height: 200,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage("your_chocolage_image"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ClipRRect(
                        // make sure we apply clip it properly
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.grey.withOpacity(0.1),
                            child: Text(
                              "Rice & curry",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )),
                margin: EdgeInsets.all(10),
              ),
            ),
          ),
          SizedBox(height: 15.0),
        ]),
      ),
    );
  }
}
