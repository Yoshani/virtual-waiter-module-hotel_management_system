import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/menu.dart';
import 'package:hotel_management_system/screens/virtual_waiter/special_offers.dart';
import 'package:hotel_management_system/services/auth.dart';
import 'package:hotel_management_system/services/vwaiter_database2.dart';
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
                    color: Colors.white,
                  )
            ),
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
              SizedBox(height: 30),
              // Container(
              //   padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              //   decoration: BoxDecoration(
              //     color: Colors.lightBlue[100],
              //     borderRadius: BorderRadius.all(Radius.circular(20))),
              //   child: 
              //     Text(
              //       "Order your food",
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.w900,
              //         fontSize: 20,
              //       ),
              //     )
              // ),
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
                        child: InkWell(
                          onTap:() {Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context){
                                return Offers(
                                );
                              },
                            ),
                          );},
                          child: Text(
                            "    Today's Special   ",
                            style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            ),
                          ),
                        )
                      ),
                ),
                Image.asset('assets/vwaiter/cover.jpg'),
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
