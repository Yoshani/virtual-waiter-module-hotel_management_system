import 'package:hotel_management_system/models/vWaiter/cartItem.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/offer.dart';
import 'package:hotel_management_system/services/vwaiter_database2.dart';
import 'package:intl/intl.dart';
import 'cart.dart';
import 'custom_future_builder.dart';
import 'offer_tile_item.dart';

class OfferTile extends StatefulWidget {
  final Offer offer;
  final VoidCallback offerPageState;
  final int index;


  OfferTile({
    @required this.offer,
    this.offerPageState,
    this.index
    });

  @override
  _OfferTileState createState() => _OfferTileState();
}

class _OfferTileState extends State<OfferTile> {


  @override
  Widget build(BuildContext context) {

    //format the date
    String formatDate(DateTime date){
      return DateFormat.yMMMd().format(date);
    }
    //future builder prevents destroying out of screen offers
    return KeepAliveFutureBuilder(
      future: VWaiterDatabase2().getOfferItems(widget.offer.items),
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return Image.asset('assets/loader.gif');
        }
        List<CartItem> itemList=snapshot.data;
        return Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: new BorderSide(color: Colors.blue, width: 2.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 10),
                  Text(
                    widget.offer.name,
                    style: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      fontFamily: 'Consolas',
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "Offer valid till ${formatDate(widget.offer.validTill)}",
                    style: TextStyle(
                      color: Colors.red[900],
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                      child: ListView.separated(
                      itemCount: itemList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index)  {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width/1.9,
                            child: Align(
                              alignment: Alignment.center,
                                child: Icon(
                                Icons.add,
                                color: Colors.indigo[900]
                              ),
                            ),
                          ),
                        );
                      },
                      itemBuilder: (context, index) {
                        return OfferTileItem(
                          offerItem: itemList[index],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Grab this offer for only Rs. ${widget.offer.price}",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      Container(
                        height: 40.0,
                        //add offer to cart
                        child: RaisedButton(
                          key: Key("add-offer-${widget.index}-to-cart"),
                          elevation: 3.0,
                          color: Colors.red[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(
                              color: Colors.red[900], 
                              width: 2.0
                            )
                          ),
                          child: Text(
                            "Add to cart",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),

                          onPressed: (){
                            print("add-offer-${widget.index}-to-cart");
                            Cart.cartItems.add(CartItem(
                            offer: widget.offer,
                            quantity: 1,
                            ));
                            widget.offerPageState();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),   
              ],
            ),
          ),
        );
      }
    );
  }
}


