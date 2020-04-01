import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hotel_management_system/screens/kitchen/item_tile.dart';

import 'package:hotel_management_system/services/auth.dart';


class FoodItemList extends StatelessWidget {
final List menuItems;
final AuthService _auth = AuthService();

FoodItemList(this.menuItems);
  @override
  Widget build(BuildContext context) {
  print("123");
  print(menuItems[0].price);
        


    return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Food Items',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(
              color: Colors.blueAccent, //change your color here
            ),
          backgroundColor: Colors.white,
          elevation: 0.5,
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
        body: ListView.builder(
        
        itemCount: menuItems.length,
        itemBuilder: (context,index){
          return ItemTile(item:menuItems[index]);
        },
          
      ),
      ),
    );
  }
}