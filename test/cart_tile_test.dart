import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/cartItem.dart';
import 'package:hotel_management_system/models/vWaiter/item.dart';
import 'package:hotel_management_system/screens/virtual_waiter/cart.dart';
import 'package:hotel_management_system/screens/virtual_waiter/cart_tile.dart';


void main() {
  Item item = Item(name: "Test", description: "Desc", persons:0, price:0);
  CachedNetworkImage image = CachedNetworkImage(imageUrl: "example.com");
  CartItem cartItem = CartItem(quantity:1, item: item, image: image);
  Cart.cartItems = [cartItem];

  testWidgets('Cart tile test',(WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CartTile(
            cartItem: cartItem,
            onCartChanged: (){},
          ),     
        ),
      )
    );
    //finds test widget
    expect(find.byType(CartTile), findsOneWidget);
    //finds the correct quantity
    expect(find.text('1'), findsOneWidget);
    expect(find.text('0'), findsNothing);
    //finds item name
    expect(find.text('Test'), findsOneWidget);
    //finds iem price
    expect(find.text('Rs. 0'), findsOneWidget);

    //add button test
    Finder addButton = find.byKey(Key('addbutton'));
    expect(addButton, findsOneWidget);
    await tester.tap(addButton);
    await tester.pump();
    print("Quantity incremented");
    expect(cartItem.quantity, 2);

    //subtract button test
    Finder subtractButton = find.byKey(Key('subtractbutton'));
    expect(subtractButton, findsOneWidget);
    await tester.tap(subtractButton);
    await tester.pump();
    print("Quantity decremented");
    expect(cartItem.quantity, 1); 

    //subtract button cannot reduce below 1  
    await tester.tap(subtractButton);
    await tester.pump();
    print("Quantity does not decrement below 1");
    expect(cartItem.quantity, 1); 

    //remove cart item
    expect(Cart.cartItems.length, 1);
    Finder removeButton = find.byKey(Key('removebutton'));
    expect(removeButton, findsOneWidget);
    await tester.tap(removeButton);
    await tester.pump();
    print("Cart item removed");
    expect(Cart.cartItems.length, 0);
  });
}
