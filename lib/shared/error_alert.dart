import 'package:flutter/material.dart';

//create error alert
Widget doAlert(String message, BuildContext context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      backgroundColor: Colors.red[400],
      title: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 22,
        ),
      ),
      actions: [
        FlatButton(
          color: Colors.white,
          child: Text(
            "OK",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          }
        )
      ],
    );
  }
