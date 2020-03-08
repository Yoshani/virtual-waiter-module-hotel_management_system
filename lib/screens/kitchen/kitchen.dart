import 'package:hotel_management_system/screens/kitchen/edit_menu.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/services/auth.dart';

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
                    'assets/kitchen/friedrice.jpg',
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
                  child: Image.asset(
                    'assets/kitchen/icecream.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
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
