import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/cartItem.dart';
import 'package:hotel_management_system/models/vWaiter/item.dart';
import 'package:hotel_management_system/models/vWaiter/menu.dart';
import 'package:hotel_management_system/screens/virtual_waiter/home_menu_tile.dart';
import 'bottom_nav_bar.dart';
import 'cart.dart';


class ItemsScreen extends StatefulWidget {
  final Item item;
  final List<Menu> menuList;
  final CachedNetworkImage image;

  ItemsScreen({this.item, this.menuList, this.image});
  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  int quantity;


  void add(){
    quantity++;
  }

  void subtract(){
    if(quantity != 0){
      quantity--;
    }
  }

  @override
  void initState() {
    quantity=0;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 20.0),
              Container(
                height: 65.0,
                //display the menu list
                child: ListView.builder(
                  itemCount: widget.menuList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return HomeMenuTile(
                      menu: widget.menuList[index], 
                      isHome: true
                    );
                  },
                ),
              ), 
                                      
            Divider(),
            SizedBox(height: 20.0),
            Text(
              widget.item.name,
              style: TextStyle(
                color: Colors.indigo[900],
                fontFamily: 'Consolas',
                fontSize: 40,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Text(
                widget.item.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.indigo[900],
                  fontFamily: 'Roboto',
                  fontSize: 23,                     
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3.2,
                  child: widget.image,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[                               
                          Text(
                            "Rs. ${widget.item.price.toString()}",
                            style: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "Persons: ${widget.item.persons.toString()}",
                            style: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Quantity: $quantity",
                                style: TextStyle(
                                color: Colors.indigo[900],
                                fontSize: 23,
                                fontWeight: FontWeight.w800,
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  //increase quantity
                                  IconButton(
                                    key: Key('increase-quantity'),
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.red[900],
                                    ),
                                    onPressed: () => setState((){
                                      add();
                                    })
                                  ),
                                  //decrease quantity
                                  IconButton(
                                    key: Key('decrease-quantity'),
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.red[900],
                                    ),
                                    onPressed: () => setState((){
                                      subtract();
                                    })
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50.0),
                Container(
                  width: MediaQuery.of(context).size.width /2,
                  color: Colors.white,
                  height: 50.0,
                  child: RaisedButton(
                    key: Key('add-item-to-cart'),
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
                        Icons.add_shopping_cart,
                        color: Colors.red[900],
                        size: 40,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          "Add to cart",
                          style: TextStyle(
                            color: Colors.red[900],
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    //add item to cart if qunatity is not zero
                    onPressed: (){
                      if(quantity==0){ 
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {                   
                            return AlertDialog(
                              backgroundColor: Colors.lightBlue[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0))
                              ),
                              title: Text(
                                "Please specify a quantity",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                ),
                              ),
                              actions: [
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(100.0))
                                  ),
                                  color: Colors.white,
                                  child: Text(
                                    "OK",
                                    style: TextStyle(
                                      color: Colors.cyan[400],
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
                        );
                      }
                      else{
                        setState((){
                          Cart.cartItems.add(CartItem(
                            item: widget.item,
                            image: widget.image,
                            quantity: quantity,
                          ));
                        });
                      }
                    },
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
