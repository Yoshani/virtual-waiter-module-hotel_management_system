import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/item.dart';
import 'package:hotel_management_system/models/vWaiter/menu.dart';
import 'package:hotel_management_system/screens/virtual_waiter/item.dart';

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
        home: ItemsScreen(
          item: item, 
          menuList: menuList, 
          image: CachedNetworkImage(imageUrl: "example.com")
        ),
      ),
    );
    await tester.pumpAndSettle();
    //finds test widget
    expect(find.byType(ItemsScreen), findsOneWidget);

    Finder addButton = find.byKey(Key('increase-quantity'));
    Finder subtractButton = find.byKey(Key('decrease-quantity'));
    Finder addToCartButton = find.byKey(Key('add-item-to-cart'));

    //finds item page UI
    expect(find.text("TestItem"), findsOneWidget);
    expect(find.text("Desc"), findsOneWidget);
    expect(find.text("Persons: 0"), findsOneWidget);
    expect(find.text("Rs. 0"), findsOneWidget);
    //assert quantity always starts by 0
    expect(find.text("Quantity: 0"), findsOneWidget);
    expect(find.text("Quantity: 1"), findsNothing);

    expect(addButton, findsOneWidget);
    expect(subtractButton, findsOneWidget);
    expect(addToCartButton, findsOneWidget);

    //increase quantity by 2
    await tester.tap(addButton);
    await tester.pumpAndSettle();
    await tester.tap(addButton);
    await tester.pumpAndSettle();
    print("Quantity increased");
    expect(find.text("Quantity: 2"), findsOneWidget);
    expect(find.text("Quantity: 0"), findsNothing);

    //decrease quantity by 1
    await tester.tap(subtractButton);
    await tester.pumpAndSettle();
    print("Quantity decreased");
    expect(find.text("Quantity: 1"), findsOneWidget);
    expect(find.text("Quantity: 2"), findsNothing);

    //add item to cart
    await tester.tap(addToCartButton);
    await tester.pumpAndSettle();
    print("Added to cart");
    //navigation bar cart icon displays "1"
    expect(find.text("1"), findsOneWidget);
  });
}
