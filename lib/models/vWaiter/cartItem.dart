import 'item.dart';
import 'offer.dart';

class CartItem{

  int quantity;
  final Item item;
  final Offer offer;

  CartItem({this.quantity, this.item, this.offer});

}