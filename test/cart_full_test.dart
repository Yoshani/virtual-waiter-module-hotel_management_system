import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/cartItem.dart';
import 'package:hotel_management_system/models/vWaiter/item.dart';
import 'package:hotel_management_system/models/vWaiter/restaurantTable.dart';
import 'package:hotel_management_system/screens/virtual_waiter/cart.dart';
import 'package:hotel_management_system/screens/virtual_waiter/customer_seat.dart';
import 'package:hotel_management_system/screens/virtual_waiter/settings.dart';


void main() {
  Item item = Item(name: "Test", description: "Desc", persons:0, price:0);
  CachedNetworkImage image = CachedNetworkImage(imageUrl: "example.com");
  CartItem cartItem = CartItem(quantity:1, item: item, image: image);
  Cart.cartItems = [cartItem, cartItem, cartItem];
  Settings.table = RestaurantTable(seats: 0);

  testWidgets('Cart full test',(WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = Size(1536, 2048);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    // resets the screen to its original size after the test end
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

    await tester.pumpWidget(
        MaterialApp(
        home: Cart()
      ),
    );
    await tester.pumpAndSettle();
    //finds test widget
    expect(find.byType(Cart), findsOneWidget);

    //finds full cart UI
    expect(find.text("Sub Total"), findsOneWidget);
    expect(find.text("Service Charges"), findsOneWidget);
    expect(find.text("Order Total"), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    Finder subtotalText = find.byKey(Key('subtotal'));
    Finder serviceText = find.byKey(Key('service'));
    Finder totalText = find.byKey(Key('total'));
    Finder placeButton = find.byKey(Key('placebutton'));
    expect(subtotalText, findsOneWidget);
    expect(serviceText, findsOneWidget);
    expect(totalText, findsOneWidget);
    expect(placeButton, findsOneWidget);

    //press place button
    await tester.tap(placeButton);
    await tester.pump();
    print("Place button pressed");
    await tester.pumpAndSettle();
    expect(find.byType(PositionForm), findsOneWidget);
  });
}
