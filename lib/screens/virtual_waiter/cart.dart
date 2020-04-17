import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/cartItem.dart';
import 'package:hotel_management_system/models/vWaiter/item.dart';
import 'package:hotel_management_system/models/vWaiter/menu.dart';
import 'package:hotel_management_system/screens/virtual_waiter/home_menu_tile.dart';
import 'package:hotel_management_system/services/auth.dart';
import 'bottom_nav_bar.dart';
import 'cart_tile.dart';
import 'myappbar.dart';

// List<CartItem> cartItems = [];

class Cart extends StatefulWidget {

  static List<CartItem> cartItems = [];

  Cart();
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  final AuthService auth = AuthService();

  List<num> bill = [];
  @override
  void initState() {
    super.initState();
  }

  List<num> calculateCartTotal(){
    int total=0;
    double serviceCharges=0;
    int subtotal=0;
    Cart.cartItems.forEach((cartItem){
      total += (cartItem.item.price)*cartItem.quantity;   
    });

    serviceCharges = total*(5/100);
    subtotal = (total+serviceCharges).round();
    return [total, serviceCharges, subtotal];
  }
  
  @override
  Widget build(BuildContext context) {

    void _onCartChanged() {
        setState(() {
      });
    }

  if(Cart.cartItems.isNotEmpty){
    bill = calculateCartTotal();
  }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(   
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
            color: Colors.black,
          ),
            onPressed: () => Navigator.pop(context)
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1.5,
      ),

      body: Container(
        child: Column(
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
                  "          Your Food Cart        ",
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  ),
                )
              ),
            ),
            SizedBox(height: 30.0),
            Cart.cartItems.isEmpty ? 
              Column(
                children: <Widget>[
                  Center(
                    child: 
                    Text(
                      "Your cart is empty!",
                      style: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Center(
                    child: Text(
                      "Choose your favorite choice of meal.",
                      style: TextStyle(
                      color: Colors.indigo[500],
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Every meal is prepared just to suit your personal taste!",
                      style: TextStyle(
                      color: Colors.indigo[500],
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                  child: Image.asset(
                    "assets/vwaiter/food.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                ],
              )
              :Column(
                children: <Widget>[
                  Container(
                    height: 350.0,
                    child: ListView.builder(
                      itemCount: Cart.cartItems.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CartTile(
                          onCartChanged: _onCartChanged,
                          cartItem: Cart.cartItems[index], 
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 50.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Cart Total",
                            style: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                              ),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            "Service Charges",
                            style: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            "Sub Total",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Rs. ${bill[0].toString()}",
                            style: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.w800,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            "Rs. ${bill[1].toString()}   (5%)",
                            style: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.w800,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            "Rs. ${bill[2].toString()}",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w800,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                 
                  SizedBox(height: 30.0),
                  //place order button
                  Container(
                    width: MediaQuery.of(context).size.width /2,
                    color: Colors.white,
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Colors.red[900], 
                          width: 2.0
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                          Icons.arrow_forward,
                          color: Colors.red[900],
                          size: 40,
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            "Place Order",
                            style: TextStyle(
                              color: Colors.red[900],
                              fontWeight: FontWeight.w800,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),

                      onPressed: (){},
                    ),
                  ),
                ],
              ),
              
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[400],
        elevation: 8.0,
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Image.asset('assets/logo.png'),
        ),
        onPressed: (){},
      ),
    );
  }
}
