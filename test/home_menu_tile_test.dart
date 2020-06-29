import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/menu.dart';
import 'package:hotel_management_system/screens/virtual_waiter/category.dart';
import 'package:hotel_management_system/screens/virtual_waiter/home_menu_tile.dart';

void main() {
  Menu menu = Menu(category: "Test", menuItems: [], image: "example.com");

  // test assumes a home menu tile on the home page
  testWidgets('Home menu tile test',(WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: HomeMenuTile(menu: menu, tap: (){}, isHome: true, index: 0)),
      ),
    );
    await tester.pumpAndSettle();
    //finds test widget
    expect(find.byType(HomeMenuTile), findsOneWidget);

    //finds home menu tile category
    expect(find.text("Test"), findsOneWidget);

    //tap category
    await tester.tap(find.byKey(Key('homebutton-0')));
    await tester.pumpAndSettle();
    print("Category button pressed");
    expect(find.byType(CategoriesScreen), findsOneWidget);
  });
}
