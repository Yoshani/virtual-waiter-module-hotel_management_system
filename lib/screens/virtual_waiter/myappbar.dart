import 'package:flutter/material.dart';
import 'package:hotel_management_system/services/auth.dart';

class MyAppBar extends AppBar{
  final BuildContext context;
  final AuthService auth;
  final Function onBackArrowPressed;

  
  MyAppBar({this.context, this.auth, this.onBackArrowPressed})
    :super(   
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.keyboard_backspace,
          color: Colors.black,
        ),
          onPressed: onBackArrowPressed,
      ),
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
              await auth.signOut();
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
    );
}