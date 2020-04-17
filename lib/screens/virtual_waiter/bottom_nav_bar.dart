import 'package:flutter/material.dart';
import 'package:hotel_management_system/screens/virtual_waiter/vwaiter_home.dart';
import 'cart.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width:7),
          IconButton(
            icon: Icon(
              Icons.home,
              size: 24.0,
              color: Colors.white
            ),
            color: Colors.black,
            onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/'),),
          ),

          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 24.0,
              color: Colors.white
            ),
            color:Colors.lightBlue[400],
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context){
                    return Cart();
                  },
                ),
              );
            },
          ),
          //extra icon added to achieve evenness
          IconButton(
            icon: Icon(
              Icons.add,
              size: 24.0,
              color: Colors.white
            ),
            color:Colors.lightBlue[400],
            onPressed: (){},
          ),

          IconButton(
            icon: Icon(
              Icons.shopping_basket,
              size: 24.0,
              color: Colors.white
            ),
            color:Colors.lightBlue[400],
            onPressed: (){},
          ),

          IconButton(
            icon: Icon(
              Icons.feedback,
              size: 24.0,
              color: Colors.white
            ),
            color:Colors.lightBlue[400],
            onPressed: (){},
          ),

          SizedBox(width:7),
        ],
      ),
      color: Colors.cyan[400],
      shape: CircularNotchedRectangle(),
    );
  }     
}