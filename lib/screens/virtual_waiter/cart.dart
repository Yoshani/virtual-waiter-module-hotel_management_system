import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/cartItem.dart';
import 'package:hotel_management_system/models/vWaiter/item.dart';
import 'bottom_nav_bar.dart';
import 'cart_tile.dart';
import 'customer_seat.dart';

class Cart extends StatefulWidget {

  //cart items list
  static List<CartItem> cartItems = [];

  Cart();
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {


  List<num> bill = [];
  @override
  void initState() {
    super.initState();
  }

  //calculate bill
  List<num> calculateCartTotal(){
    int subtotal=0;
    int serviceCharges=0;
    int total=0;
    Cart.cartItems.forEach((cartItem){
      if(cartItem.item is Item){
        subtotal += (cartItem.item.price)*cartItem.quantity; 
      }else{
        subtotal+=(cartItem.offer.price)*cartItem.quantity;
      }  
    });

    serviceCharges = (subtotal*(5/100)).round();
    total = subtotal+serviceCharges;
    return [subtotal, serviceCharges, total];
  }
  
  
  @override
  Widget build(BuildContext context) {

    void _onCartChanged() {
        setState(() {
      });
    }

    //prompt to get seat number
    void _showPrompt(int subtotal, int total) {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          height: 400,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: PositionForm(subtotal: subtotal, total: total, onCartChanged: _onCartChanged),
        );
      });
    }

  if(Cart.cartItems.isNotEmpty){
    bill = calculateCartTotal();
  }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
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

            //display message if cart is empty
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

              //if cart has items display cart
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
                            "Sub Total",
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
                            "Order Total",
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
                            key: Key('subtotal'),
                            style: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.w800,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            "Rs. ${bill[1].toString()}   (5%)",
                            key: Key('service'),
                            style: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.w800,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            "Rs. ${bill[2].toString()}",
                            key: Key('total'),
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
                      key: Key('placebutton'),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
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

                      onPressed: (){_showPrompt(bill[0], bill[2]);},
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
