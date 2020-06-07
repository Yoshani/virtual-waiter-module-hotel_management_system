import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/restaurantTable.dart';
import 'package:hotel_management_system/screens/virtual_waiter/cart.dart';
import 'package:hotel_management_system/screens/virtual_waiter/customer_seat.dart';
import 'package:hotel_management_system/screens/virtual_waiter/settings.dart';

void main() {
  Cart.cartItems = [];
  Settings.table = RestaurantTable(seats: 1);

  testWidgets('Customer seat prompt test',(WidgetTester tester) async {

    await tester.pumpWidget(
        MaterialApp(
        home: Scaffold(
          body: PositionForm(
            total: 0, 
            subtotal: 0, 
            onCartChanged: (){}
          )
        )
      ),
    );
    await tester.pumpAndSettle();
    //finds test widget
    expect(find.byType(PositionForm), findsOneWidget);

    //finds position form UI
    expect(find.text('Please specify your seat number'), findsOneWidget);

    Finder dropdown = find.byKey(Key('dropdownbuttonformfield'));
    Finder submit = find.byKey(Key('submit'));
    expect(dropdown, findsOneWidget);
    expect(submit, findsOneWidget);

    //cannot submit order with empty seat
    await tester.tap(submit);
    await tester.pumpAndSettle();
    expect(find.byType(PositionForm), findsOneWidget);

    // select a seat
    await tester.tap(dropdown);
    print("Drop down button pressed");
    Finder seat = find.text('Seat 1');
    expect(seat, findsOneWidget);
    await tester.tap(seat);
    expect(seat, findsOneWidget);

    //cannot submit order with empty cart
    await tester.tap(submit);
    await tester.pumpAndSettle();
    expect(find.byType(PositionForm), findsOneWidget);

  });
}
