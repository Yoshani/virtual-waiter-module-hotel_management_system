import 'package:flutter/material.dart';

class OrderLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: Colors.white,
          child: Image.asset('assets/setloader.gif'),
        ),
      ),
    );  
  }
}