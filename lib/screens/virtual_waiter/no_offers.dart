import 'package:flutter/material.dart';

class NoOffers extends StatefulWidget {
  @override
  _NoOffersState createState() => _NoOffersState();
}

class _NoOffersState extends State<NoOffers> {

  @override
  Widget build(BuildContext context) {  
    //display widget if no offers are available       
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: 50.0),
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
              "         Exclusive Special Offers        ",
              style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 20,
              ),
            )
          ),
        ),
        SizedBox(height: 20.0),
        Center(
          child: 
          Text(
            "Sorry!",
            style: TextStyle(
            color: Colors.indigo[900],
            fontWeight: FontWeight.w900,
            fontSize: 30,
            ),
          ),
        ),
          SizedBox(height: 3.0),
          Center(
            child: Text(
              "We are out of offers today!",
              style: TextStyle(
              color: Colors.indigo[900],
              fontWeight: FontWeight.w500,
              fontSize: 25,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Text(
              "Pick out your favorite meal from our menu",
              style: TextStyle(
              color: Colors.indigo[800],
              fontWeight: FontWeight.w500,
              fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            child: Image.asset(
              "assets/vwaiter/noOffers.jpg",
              fit: BoxFit.fill,
            ),
          ),
      ],
    );
  }
}