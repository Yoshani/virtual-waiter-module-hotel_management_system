import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/menu.dart';
import 'package:hotel_management_system/services/auth.dart';
import 'package:hotel_management_system/services/vwaiter_database2.dart';
import 'bottom_nav_bar.dart';
import 'cart.dart';
import 'menu_list.dart';
import 'package:hotel_management_system/services/vwaiter_database.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VwaiterHome extends StatelessWidget {
  final AuthService _auth = AuthService();

  Widget build(BuildContext context) {

    return StreamProvider<List<Menu>>.value(
      value: VWaiterDatabase2().menu,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1.5,
          actions: <Widget>[
            PopupMenuButton<Widget>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: FlatButton.icon(
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
          ]
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
                        fontFamily: 'Roboto',
                        fontSize: 45.0,
                        color: Colors.blue[500],
                      ),
                    ),
                    Text(
                      "Restaurant",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        fontSize: 45.0,
                        color: Colors.blue[500],
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
              MenuList(isHome: true), //render menu categories
              SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
                child: 
                  Text(
                    "Search your food",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  )
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                        decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50)
                          )
                        ),
                        child: Text(
                                "    Today's Special   ",
                                style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                                ),
                              )
                        ),
                ),
              ],
            )
          ),
          bottomNavigationBar: BottomNavigation(),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.cyan[400],
            elevation: 8.0,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Image.asset('assets/logo.png'),
            ),
            onPressed: (){},
          ),
      ),
    );
  }
}
