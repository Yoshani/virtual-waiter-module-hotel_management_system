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
        title: Text('test'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            Container(
              height: 200,
              child: Card(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 100,
                      width: 200,
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
                          child: Image.asset(
                            'assets/kitchen/rice-and-curry.jfif',
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 60, 20, 20),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 200,
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
                          child: Image.asset(
                            'assets/kitchen/friedrice.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 60, 20, 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 200,
              child: Card(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 100,
                      width: 200,
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
                          child: Image.asset(
                            'assets/kitchen/rice-and-curry.jfif',
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 60, 20, 20),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 200,
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
                          child: Image.asset(
                            'assets/kitchen/friedrice.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 60, 20, 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 200,
              child: Card(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 100,
                      width: 200,
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
                          child: Image.asset(
                            'assets/kitchen/rice-and-curry.jfif',
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 60, 20, 20),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 200,
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
                          child: Image.asset(
                            'assets/kitchen/friedrice.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 60, 20, 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
