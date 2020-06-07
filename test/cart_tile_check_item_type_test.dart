import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_management_system/models/vWaiter/cartItem.dart';
import 'package:hotel_management_system/models/vWaiter/item.dart';
import 'package:hotel_management_system/models/vWaiter/offer.dart';
import 'package:hotel_management_system/screens/virtual_waiter/cart_tile.dart';
import 'package:mockito/mockito.dart';

class MockItem extends Mock implements Item{}
class MockOffer extends Mock implements Offer{}

void main() {
  Item item = MockItem();
  Offer offer = MockOffer();
  CartItem cartItem1 = CartItem(item: item);
  CartItem cartItem2 = CartItem(offer: offer);

  test('cart item is an instance of Item returns true', () {
    final result = CheckItemType.checkItemType(cartItem1);
    expect(result, true);
  });

  test('cart item is not an instance of Item returns false', () {

    final result = CheckItemType.checkItemType(cartItem2);
    expect(result, false);
  });


}