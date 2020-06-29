import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/models/vWaiter/cartItem.dart';
import 'package:hotel_management_system/models/vWaiter/item.dart';
import 'package:hotel_management_system/screens/virtual_waiter/offer_tile_item.dart';

void main() {
  Item item = Item(name: "TestItem", description: "Desc", persons:0, price:0, image: "example.com");
  CartItem offerItem = CartItem(quantity: 0, item: item, image: CachedNetworkImage(imageUrl: "example.com",));

  testWidgets('Offer tile item test',(WidgetTester tester) async {
    //adjust test screen size
    tester.binding.window.physicalSizeTestValue = Size(1536, 2048);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    // resets the screen to its original size after the test end
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

    await tester.pumpWidget(
        MaterialApp(
        home: Scaffold(body: OfferTileItem(offerItem: offerItem)),
      ),
    );
    await tester.pumpAndSettle();
    //finds test widget
    expect(find.byType(OfferTileItem), findsOneWidget);

    //finds offer tile item text
    expect(find.text("0  TestItem"), findsOneWidget);


  });
}
