import 'package:cached_network_image/cached_network_image.dart';
import 'package:hotel_management_system/models/vWaiter/cartItem.dart';
import 'package:flutter/material.dart';

class OfferTileItem extends StatefulWidget {
  final CartItem offerItem;

  OfferTileItem({
    @required this.offerItem,
    });

  @override
  _OfferTileItemState createState() => _OfferTileItemState();
}

class _OfferTileItemState extends State<OfferTileItem> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.white,
            backgroundImage: CachedNetworkImageProvider(widget.offerItem.item.image), 
            ),
      title:Text(
        '${widget.offerItem.quantity}  ${widget.offerItem.item.name}',
        style: TextStyle(
          color: Colors.indigo[900],
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      // subtitle:Text(
      //   "Item price: Rs. ${widget.item.price.toString()}",
      //   style: TextStyle(
      //     color: Colors.indigo[900],
      //     fontWeight: FontWeight.w500,
      //     fontSize: 20,
      //   ),
      // ),
    );
  }
}


