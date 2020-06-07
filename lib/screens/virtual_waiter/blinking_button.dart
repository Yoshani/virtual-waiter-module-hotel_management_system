import 'package:flutter/material.dart';
import 'package:hotel_management_system/screens/virtual_waiter/special_offers.dart';

  class MyBlinkingButton extends StatefulWidget {
    @override
    _MyBlinkingButtonState createState() => _MyBlinkingButtonState();
  }

  class _MyBlinkingButtonState extends State<MyBlinkingButton>
      with SingleTickerProviderStateMixin {
    AnimationController _animationController;

    @override
    void initState() {
      _animationController =
          AnimationController(vsync: this, duration: Duration(seconds: 1));
      _animationController.repeat();
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return InkWell(
        key: Key('blinking-button'),
        onTap:() {Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context){
              return Offers(
              );
            },
          ),
        );},
        child: FadeTransition(       
          opacity: _animationController,
          child: Container(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              )
            ),
            child: Text(
              "    Check Out Special Offers   ",
              style: TextStyle(
              color: Colors.indigo[900],
              fontWeight: FontWeight.w900,
              fontSize: 23,
              ),
            ),
          ),
        ),
      );
    }

    @override
    void dispose() {
      _animationController.dispose();
      super.dispose();
    }
  }