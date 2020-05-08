import 'package:cached_network_image/cached_network_image.dart';

import 'item.dart';
import 'offer.dart';

class CartItem{

  int quantity;
  final Item item;
  final Offer offer;
  final CachedNetworkImage image;

  CartItem({this.quantity, this.item, this.offer, this.image});

}