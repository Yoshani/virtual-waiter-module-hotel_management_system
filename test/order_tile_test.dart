import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/order.dart';
import 'package:hotel_management_system/screens/virtual_waiter/feedback.dart';
import 'package:hotel_management_system/screens/virtual_waiter/order_tile.dart';

void main() {

  //order status is 'placed'
  testWidgets('Order status tile test',(WidgetTester tester) async {
    Order order = Order(orderId: 'id', status: "placed", seat: 0);
    //adjust test screen size
    tester.binding.window.physicalSizeTestValue = Size(1536, 2048);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    // resets the screen to its original size after the test end
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

    await tester.pumpWidget(
        MaterialApp(
        home: Scaffold(body: OrderTile(order: order)),
      ),
    );
    await tester.pumpAndSettle();
    //finds test widget
    expect(find.byType(OrderTile), findsOneWidget);

    //finds offer tile item text
    expect(find.text("Seat 0"), findsOneWidget);
    expect(find.text("Your order is placed"), findsOneWidget);
  });


  //order status is 'served'
  testWidgets('Order status tile test',(WidgetTester tester) async {
    Order order = Order(orderId: 'id', status: "served", seat: 0);
    //adjust test screen size
    tester.binding.window.physicalSizeTestValue = Size(1536, 2048);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    // resets the screen to its original size after the test end
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

    await tester.pumpWidget(
        MaterialApp(
        home: Scaffold(body: OrderTile(order: order)),
        routes: {
          '/feedback': (context) => CustomerFeedback(),
        },
      ),
    );
    await tester.pumpAndSettle();
    //finds test widget
    expect(find.byType(OrderTile), findsOneWidget);

    //finds offer tile item text
    expect(find.text("Seat 0"), findsOneWidget);
    expect(find.byType(RaisedButton), findsOneWidget);
    expect(find.text("Finished"), findsOneWidget);
    expect(find.text("Bring bill"), findsOneWidget);
    expect(find.text("Your order is served"), findsOneWidget);

    await tester.tap(find.byType(RaisedButton));
    await tester.pumpAndSettle(Duration(seconds: 10));
    print("Finished button pressed");
    await tester.tap(find.byType(CustomerFeedback));
    
  });
}
