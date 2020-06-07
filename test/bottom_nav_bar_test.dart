import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_management_system/models/vWaiter/restaurantTable.dart';
import 'package:hotel_management_system/screens/virtual_waiter/bottom_nav_bar.dart';
import 'package:hotel_management_system/screens/virtual_waiter/cart.dart';
import 'package:hotel_management_system/screens/virtual_waiter/feedback.dart';
import 'package:hotel_management_system/screens/virtual_waiter/order_status.dart';
import 'package:hotel_management_system/screens/virtual_waiter/settings.dart';



void main() {

  Settings.table = RestaurantTable(tableId: '');
  testWidgets('Button is present and triggers navigation after tapped',(WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = Size(1536, 2048);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    // resets the screen to its original size after the test end
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomNavigation(
          ),
        ),
        routes: {
            '/cart': (context) => Cart(),
            '/orderStatus': (context) => OrderStatus(),
            '/feedback': (context) => CustomerFeedback(),
          },
      ),
    );

    expect(find.byKey(Key('homebutton')), findsOneWidget);
    expect(find.byKey(Key('cartbutton')), findsOneWidget);
    expect(find.byKey(Key('statusbutton')), findsOneWidget);
    expect(find.byKey(Key('feedbackbutton')), findsOneWidget);

    //press home button
    await tester.tap(find.byKey(Key('homebutton')));
    print("Home button pressed");
    await tester.pumpAndSettle();

    //press cart button
    await tester.tap(find.byKey(Key('cartbutton')));
    print("Cart button pressed");
    await tester.pumpAndSettle();
    expect(find.byType(Cart), findsOneWidget);

    //press feedback button
    await tester.tap(find.byKey(Key('feedbackbutton')));
    print("Feedback button pressed");
    await tester.pumpAndSettle();
    expect(find.byType(CustomerFeedback), findsOneWidget);



  });
}
