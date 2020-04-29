import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/cartItem.dart';
import 'package:hotel_management_system/models/vWaiter/item.dart';
import 'cart.dart';

class CartTile extends StatefulWidget {
  final CartItem cartItem;
  final VoidCallback onCartChanged; //set state of cart

  CartTile({
    @required this.cartItem,
    this.onCartChanged,
  });

  @override
  _CartTileState createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {

  String image;

  @override
  Widget build(BuildContext context) {

    bool checkItemType(CartItem cartItem){
      if(cartItem.item is Item){
        return true;
      }
      return false;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0,0,5.0,5.0),
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
        border: Border.all(
          color: Colors.indigo[900],
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0,0,0,0),
              child: Container(
                width: 60,
                height: 90,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.indigo[900],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(
                      Icons.add,
                      color: Colors.indigo[900],
                      size: 25,
                      ),
                      onTap: (){
                        widget.cartItem.quantity++;
                        widget.onCartChanged();
                      },
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      widget.cartItem.quantity.toString(),
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    GestureDetector(
                      child: Icon(
                      Icons.remove,
                      color: Colors.indigo[900],
                      size: 25,
                      ),
                      onTap: (){
                        if(widget.cartItem.quantity!=1){
                          widget.cartItem.quantity--;
                          widget.onCartChanged();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),

            Container(
              child: checkItemType(widget.cartItem)?
              CachedNetworkImage(
                imageUrl: widget.cartItem.item.image,
                placeholder:(context, url) => Image.asset('assets/loader.gif'),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )     

              :Image.asset('assets/vwaiter/offer.jpg')
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  checkItemType(widget.cartItem)?
                  widget.cartItem.item.name
                  :widget.cartItem.offer.name,
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Text(
                  checkItemType(widget.cartItem)?
                  "Rs. ${widget.cartItem.item.price.toString()}"
                  : "Rs. ${widget.cartItem.offer.price.toString()}",                
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.red[900],
                  size: 25,
                  ),
                onPressed: ()  {
                  Cart.cartItems.remove(widget.cartItem);
                  widget.onCartChanged();
                }
              ),
            ),
          ],
        ),
      ),
    );

  }
}


