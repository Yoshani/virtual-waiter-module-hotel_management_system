import 'package:flutter/material.dart';
import 'cart.dart';
import 'order_status.dart';
import 'feedback.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
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

          Cart.cartItems.isNotEmpty ? 
            Stack(
              children: <Widget>[
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
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 17,
                      minHeight: 17,
                    ),
                    child: Text(
                      Cart.cartItems.length.toString(),
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 12
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            )
          :IconButton(
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
            Icon(
              Icons.add,
              size: 24.0,
              color: Colors.white
            ),

          IconButton(
            icon: Icon(
              Icons.shopping_basket,
              size: 24.0,
              color: Colors.white
            ),
            color:Colors.lightBlue[400],
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context){
                    return OrderStatus();
                  },
                ),
              );
            },
          ),

          IconButton(
            icon: Icon(
              Icons.feedback,
              size: 24.0,
              color: Colors.white
            ),
            color:Colors.lightBlue[400],
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context){
                    return CustomerFeedback();
                  },
                ),
              );
            },
          ),

          SizedBox(width:7),
        ],
      ),
      color: Colors.cyan[400],
      shape: CircularNotchedRectangle(),
    );
  }     
}