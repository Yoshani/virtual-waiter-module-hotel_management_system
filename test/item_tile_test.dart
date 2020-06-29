import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/item.dart';
import 'package:hotel_management_system/models/vWaiter/menu.dart';
import 'package:hotel_management_system/screens/virtual_waiter/item.dart';
import 'package:hotel_management_system/screens/virtual_waiter/item_tile.dart';

void main() {
  Item item = Item(name: "TestItem", description: "Desc", persons:0, price:0, image: "example.com");
  Menu menu = Menu(category: "TestMenu", menuItems: [], image: "example.com");
  List<Menu> menuList = [menu, menu, menu];
  
  testWidgets('Item tile test',(WidgetTester tester) async {
    //adjust test screen size
    tester.binding.window.physicalSizeTestValue = Size(1536, 2048);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    // resets the screen to its original size after the test end
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: ItemTile(item: item, menuList: menuList, index: 0)),
      ),
    );
    await tester.pumpAndSettle();
    //finds test widget
    expect(find.byType(ItemTile), findsOneWidget);

    //finds item tile text
    expect(find.text("TestItem"), findsOneWidget);
    expect(find.text("Rs. 0"), findsOneWidget);

    //tap category
    await tester.tap(find.byKey(Key('item-0')));
    await tester.pumpAndSettle();
    print("Item tile pressed");
    expect(find.byType(ItemsScreen), findsOneWidget);
  });
}
