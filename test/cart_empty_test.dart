import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/screens/virtual_waiter/cart.dart';


void main() {
  Cart.cartItems = [];

  testWidgets('Cart empty test',(WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: Cart()
      )
    );
    //finds test widget
    expect(find.byType(Cart), findsOneWidget);

    //finds empty cart UI
    expect(find.text("Your cart is empty!"), findsOneWidget);
    expect(find.text("Choose your favorite choice of meal."), findsOneWidget);
    expect(find.text("Every meal is prepared just to suit your personal taste!"), findsOneWidget);
  });
}
