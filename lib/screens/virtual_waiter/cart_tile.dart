import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/cartItem.dart';
import 'package:hotel_management_system/models/vWaiter/item.dart';
import 'cart.dart';

//check if cart item is Item type or Offer type
class CheckItemType{
  static bool checkItemType(CartItem cartItem){
    if(cartItem.item is Item){
      return true;
    }
    return false;
  }
}


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

  @override
  Widget build(BuildContext context) {

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
                    //increase quantity
                    GestureDetector(
                      key: Key('addbutton'),
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
                    //decrease quantity
                    GestureDetector(
                      key: Key('subtractbutton'),
                      child: Icon(
                      Icons.remove,
                      color: Colors.indigo[900],
                      size: 25,
                      ),
                      onTap: (){
                        //cannot decrease quantity below 1
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
              child: CheckItemType.checkItemType(widget.cartItem)?
              widget.cartItem.image  
              :Image.asset('assets/vwaiter/offer.jpg')
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  CheckItemType.checkItemType(widget.cartItem)?
                  widget.cartItem.item.name
                  :widget.cartItem.offer.name,
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Text(
                  CheckItemType.checkItemType(widget.cartItem)?
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
              //remove button
              child: IconButton(
                key: Key('removebutton'),
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


