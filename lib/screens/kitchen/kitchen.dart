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
        title: Text('KITCHEN'),
        backgroundColor: Colors.white,
        elevation: 1.5,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.build),
            label: Text('Edit menu'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditMenu(),
                ),
              );
              // Navigator.pushNamed(context, '/test');
            },
          ),
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
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/coffee_bg.png')),
        ),
        child: Text("kitchen"),
      ),
    );
  }
}
