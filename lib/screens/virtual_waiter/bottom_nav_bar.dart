import 'package:flutter/material.dart';
import 'cart.dart';

class BottomNavigation extends StatelessWidget {

  final cart = "/cart";
  final orderStatus = "/orderStatus";
  final feedback = "/feedback";

  @override
  Widget build(BuildContext context) {

    var route = ModalRoute.of(context);

    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width:7),
          //navigate to home
          IconButton(
            key: Key('homebutton'),
            icon: Icon(
              Icons.home,
              size: 24.0,
              color: Colors.white
            ),
            color: Colors.black,
            onPressed: () {
              if(route.settings.name != '/'){
                Navigator.popUntil(context, ModalRoute.withName('/'),);
              }
            },
          ),

          Cart.cartItems.isNotEmpty ? 
            Stack(
              children: <Widget>[
                //navigate to cart
                IconButton(
                  key: Key('cartbutton'),
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 24.0,
                    color: Colors.white
                  ),
                  color:Colors.lightBlue[400],
                  onPressed: (){
                    if(route.settings.name != cart){
                      Navigator.pushNamed(context, cart);
                    }
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
            key: Key('cartbutton'),
            icon: Icon(
              Icons.shopping_cart,
              size: 24.0,
              color: Colors.white
            ),
            color:Colors.lightBlue[400],
            onPressed: (){
              if(route.settings.name != cart){
                Navigator.pushNamed(context, cart);
              }
            },
          ),         
          
          //extra icon added to achieve evenness         
            Icon(
              Icons.add,
              size: 24.0,
              color: Colors.white
            ),
          //navigate to order status tab
          IconButton(
            key: Key('statusbutton'),
            icon: Icon(
              Icons.shopping_basket,
              size: 24.0,
              color: Colors.white
            ),
            color:Colors.lightBlue[400],
            onPressed: (){
              if(route.settings.name != orderStatus){
                Navigator.pushNamed(context, orderStatus);
              }
            },
          ),
          //navigate to feedback page
          IconButton(
            key: Key('feedbackbutton'),
            icon: Icon(
              Icons.feedback,
              size: 24.0,
              color: Colors.white
            ),
            color:Colors.lightBlue[400],
            onPressed: (){
              if(route.settings.name != feedback){
                Navigator.pushNamed(context, feedback);
              }
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