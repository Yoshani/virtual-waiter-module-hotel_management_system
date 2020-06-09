import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/menu.dart';
import 'package:hotel_management_system/screens/virtual_waiter/category.dart';

void main() {
  Menu menu = Menu(category: "Test", menuItems: [], image: "example.com");

  testWidgets('Category screen test',(WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: CategoriesScreen(
          menu: menu,
        )
      ),
    );
    await tester.pumpAndSettle();
    //finds test widget
    expect(find.byType(CategoriesScreen), findsOneWidget);

  });
}
