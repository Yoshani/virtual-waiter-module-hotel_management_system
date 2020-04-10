import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/kitchen/menu.dart';
import 'package:hotel_management_system/models/kitchen/menuItem.dart';
import 'package:hotel_management_system/services/auth.dart';
import 'package:hotel_management_system/services/vwaiter_database2.dart';
import 'menu_list.dart';
import 'package:hotel_management_system/services/vwaiter_database.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VwaiterHome extends StatelessWidget {
  final AuthService _auth = AuthService();

  Widget build(BuildContext context) {

    // return new StreamBuilder(
    //   stream: Firestore.instance.collection('main-menu').snapshots(),
    //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //     if (!snapshot.hasData) return new Text('Loading...');
    //     return new ListView(
    //       children: snapshot.data.documents.map((document) {
            
    //         return new ListTile(
    //           title: new Text(document['category']),
    //         );
    //       }).toList(),
    //     );
    //   },
    // );

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
                )),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          // child: Image(image: AssetImage(
          //   'cart.png',
          // ),
          // fit: BoxFit.cover,),
          child: Icon(Icons.shopping_cart),
          elevation: 10.0,
        ),
        //         bottomNavigationBar: BottomAppBar(
        //   color: Colors.black,
        //           child: Image.asset('assets/vwaiter/logo.jpg'),
        // ),
        // floatingActionButton: FloatingActionButton(onPressed: null),

        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () { },
        //   tooltip: 'Increment',
        //   // child: Image(image: AssetImage(
        //   //   'cart.png',
        //   // ),
        //   // fit: BoxFit.cover,),
        //   child: Icon(Icons.shopping_cart),
        //   elevation: 50.0,
        // ),
        // bottomNavigationBar: BottomAppBar(
        //   elevation: 45.0,
        //   child: new Row(
        //     mainAxisSize: MainAxisSize.max,
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       IconButton(
        //         icon: Icon(Icons.menu),
        //         color: Colors.white,
        //         onPressed: () {},
        //       ),
        //       IconButton(
        //         icon: Icon(Icons.search),
        //         color: Colors.white,
        //         onPressed: () {},
        //       ),
        //     ],
        //   ),
        //   color: Colors.white,
        // ),
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
            MenuList(isHome: true), //render menu categories
            SizedBox(height: 30),
            Container(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                decoration: BoxDecoration(
                    color: Colors.lightBlue[100],
                    // border: Border.all(
                    //   color: Colors.lightBlue[500],
                    // ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text(
                  "Search your food",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                )),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  child: Text(
                    "    Today's Special   ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  )),
            ),
//             CarouselSlider(
//               height: MediaQuery.of(context).size.height/2.4,
//               items: map<Widget>(
//                 foods,
//                     (index, i){
//                       Map food = foods[index];
//                   return SliderItem(
//                     img: food['img'],
//                     isFav: false,
//                     name: food['name'],
//                     rating: 5.0,
//                     raters: 23,
//                   );
//                 },
//               ).toList(),
//               autoPlay: true,
// //                enlargeCenterPage: true,
//               viewportFraction: 1.0,
// //              aspectRatio: 2.0,
//               onPageChanged: (index) {
//                 setState(() {
//                   _current = index;
//                 });
//               },
//             ),
          ],
        )),
      ),
    );
  }
}
