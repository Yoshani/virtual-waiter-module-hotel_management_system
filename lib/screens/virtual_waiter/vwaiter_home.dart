import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/menu.dart';
import 'package:hotel_management_system/services/auth.dart';
import 'package:hotel_management_system/services/vwaiter_database2.dart';
import 'package:hotel_management_system/utilities/carousal.dart';
import 'blinking_button.dart';
import 'bottom_nav_bar.dart';
import 'menu_list.dart';
import 'package:provider/provider.dart';
import 'settings.dart';

class VwaiterHome extends StatelessWidget {
  final AuthService _auth = AuthService();

  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          height: 400,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: Settings(),
        );
      });
    }

    return StreamProvider<List<Menu>>.value(
      value: VWaiterDatabase2().menu,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1.5,
          leading: Builder(
            builder: (BuildContext context) {
              return PopupMenuButton<Widget>(
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
                      color: Colors.white,
                )
              );
            },
          ),
          actions: <Widget>[

            GestureDetector(
              child: Icon(
                Icons.settings,
                color: Colors.grey[500],
                ),
              onTap: () => _showSettingsPanel(),
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
              SizedBox(height: 60),
              MyBlinkingButton(),
              SizedBox(height: 30),               
              CarouselSlider(
                height: MediaQuery.of(context).size.height/2.4,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                autoPlayCurve: Curves.decelerate,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                items: carousal.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: image,
                      );
                    },
                  );
                }).toList(),
              )
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
