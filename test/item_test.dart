import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_management_system/models/vWaiter/item.dart';
import 'package:hotel_management_system/models/vWaiter/menu.dart';
import 'package:hotel_management_system/screens/virtual_waiter/item.dart';
import 'package:mockito/mockito.dart';
// import 'package:image_test_utils/image_test_utils.dart';



class MockItem extends Mock implements Item{}
class MockMenu extends Mock implements Menu{}

void main() {
  // MockItem _item = MockItem();
  // MockMenu _menu = MockMenu();
  Item _item = Item(name: "Test", description: "Test", persons: 2, price: 350);
  Menu _menu = Menu();
  List<Menu> _menuList = [_menu, _menu, _menu];
  final CachedNetworkImage _image = CachedNetworkImage(imageUrl: "assets/vwaiter/food.jpg",);

    MaterialApp app = MaterialApp(
    home: Scaffold(
        body:  ItemsScreen(
          item: _item,
          menuList: _menuList,
          image: _image,
        )
    ),
  );
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    Item _item = Item(name: "Test", description: "Test", persons: 2, price: 350);
    Menu _menu = Menu(category: "Test");
    List<Menu> _menuList = [_menu, _menu, _menu];
    CachedNetworkImage _image = CachedNetworkImage(imageUrl: "assets/vwaiter/food.jpg",);
    ItemsScreen it = ItemsScreen(
          item: _item,
          menuList: _menuList,
          image: _image,
        );

    await tester.pumpWidget(it);

    // expect(find.text('0'), findsOneWidget);

    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsWidgets);
  });
}
