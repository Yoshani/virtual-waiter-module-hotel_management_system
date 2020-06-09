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
        child: ClipOval(child:CachedNetworkImage(
          imageUrl: widget.offerItem.item.image,
          placeholder:(context, url) => Image.asset('assets/miniloader.gif'),
          errorWidget: (context, url, error) => Image.asset('assets/miniloader.gif'),
          fit: BoxFit.fill,
        ),),
      ),
      title:Text(
        '${widget.offerItem.quantity}  ${widget.offerItem.item.name}',
        style: TextStyle(
          color: Colors.indigo[900],
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
    );
  }
}


