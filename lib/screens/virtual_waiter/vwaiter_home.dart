import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/kitchen/menuItem.dart';
import 'package:hotel_management_system/services/auth.dart';
import 'menu_list.dart';
import 'package:hotel_management_system/services/vwaiter_database.dart';
import 'package:provider/provider.dart';

class VwaiterHome extends StatelessWidget {
  final AuthService _auth = AuthService();

  Widget build(BuildContext context) {
    return StreamProvider<List<MenuItem>>.value(
        value: VWaiterDatabase().menuItems,
        child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1.5,
          actions: <Widget>[PopupMenuButton<Widget>(
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child:  FlatButton.icon(
                              icon: Icon(Icons.person),
                              label: Text('Logout'),
                              onPressed: () async {
                                Navigator.pop(context);
                                await _auth.signOut();
                              },
                            ),
                  ),
   
                ],
            icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  )
            
          ),
          ],
        ),
          body: Container(
            child: Column(
              children: <Widget>[
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Text(
                        "Welcome to Pearl",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'RobotoSlab-VariableFont_wght',
                          fontSize: 45.0,
                          color: Colors.blue[500],
                        ),
                      ),
                      Text(
                          "Restaurant",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RobotoSlab-VariableFont_wght',
                            fontSize: 45.0,
                            color: Colors.blue[500],
                          ),
                        ),
                         SizedBox(height: 20.0),
                    ],
                  ),
                ),
                MenuList(), //render menu item names 
                SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[100],
                    // border: Border.all(
                    //   color: Colors.lightBlue[500],
                    // ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Text(
                    "Search your food",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                  )
                )
              ],
            )
          ),
      ),
    );
  }
}
