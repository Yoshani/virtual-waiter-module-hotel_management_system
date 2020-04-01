import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/kitchen/KitchenData.dart';
import 'package:hotel_management_system/services/kitchen_database.dart';
import 'package:hotel_management_system/screens/kitchen/foodItemList.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text('test1'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.redAccent,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Container(
              color: Colors.amber,
              height: 250,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Card(
                      // margin: EdgeInsets.fromLTRB(0, 20, 0, 10),

                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            height: 100,
                            width: 180,
                            child: Card(
                              elevation: 5,
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
                                child: Container(
                                  height: 100,
                                  // width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          'assets/kitchen/rice-and-curry.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    // make sure we apply clip it properly
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 0.5, sigmaY: 0.5),
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.black.withOpacity(0.3),
                                        child: Text(
                                          "Rice & curry",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              margin: EdgeInsets.fromLTRB(10, 100, 10, 20),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 175,
                            child: Card(
                              elevation: 5,
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
                                child: Container(
                                  height: 200,
                                  // width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          'assets/kitchen/friedrice.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    // make sure we apply clip it properly
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 0.5, sigmaY: 0.5),
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.black.withOpacity(0.3),
                                        child: Text(
                                          "Fried rice",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              margin: EdgeInsets.fromLTRB(0, 100, 10, 20),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 170,
                            child: Card(
                              elevation: 5,
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
                                child: Container(
                                  height: 200,
                                  // width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          'assets/kitchen/friedrice.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    // make sure we apply clip it properly
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 1, sigmaY: 1),
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.grey.withOpacity(0.1),
                                        child: Text(
                                          "Fried rice",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              margin: EdgeInsets.fromLTRB(0, 100, 10, 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 100,
                    child: Container(
                      height: 50,
                      width: 150,
                      child: Card(
                        elevation: 5,
                        child: Center(
                          child: Text("Rice",
                              style: TextStyle(
                                  fontSize: 20, fontFamily: 'Consolas')),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 3.0),
          ],
        ),
      ),
    );
  }
}
