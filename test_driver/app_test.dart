// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Virtual Waiter', () {

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });


    test("Log in to virtual waiter", () async{
      final emailFieldFinder = find.byValueKey('enter-email');
      final passwordFieldFinder = find.byValueKey('enter-password');
      final submitButtonFinder = find.byValueKey('signin');

      await driver.waitFor(emailFieldFinder);
      await driver.tap(emailFieldFinder);
      await driver.enterText('vwaiter@gmail.com');
      await driver.waitFor(find.text('vwaiter@gmail.com'));

      await driver.waitFor(passwordFieldFinder);
      await driver.tap(passwordFieldFinder);
      await driver.enterText('123456');
      await driver.waitFor(find.text('123456'));

      await driver.waitFor(submitButtonFinder);
      await driver.tap(submitButtonFinder);
      await Future.delayed(Duration(seconds: 2));
    });


    test("view empty cart", () async{
      await driver.runUnsynchronized(() async {
        final cartButton = find.byValueKey('cartbutton');
        await driver.waitFor(cartButton);
        await driver.tap(cartButton);
        await Future.delayed(Duration(seconds: 2));
      });
    });

    test("view empty order status tab", () async{
        final statusButton = find.byValueKey('statusbutton');
        await driver.waitFor(statusButton);
        await driver.tap(statusButton);
        await Future.delayed(Duration(seconds: 2));
    });

    test("view feedback tab", () async{
        final feedbackButton = find.byValueKey('feedbackbutton');
        await driver.waitFor(feedbackButton);
        await driver.tap(feedbackButton);
        await Future.delayed(Duration(seconds: 2));
    });

    test("navigate to home", () async{
      final homeButton = find.byValueKey('homebutton');
      await driver.waitFor(homeButton);
      await driver.tap(homeButton);
      await Future.delayed(Duration(seconds: 2));
    });

    test("change virtual waiter settings", () async{
      await driver.runUnsynchronized(() async {
        final settingsButton = find.byValueKey('vwaiter-settings');
        final dropdownButton = find.byValueKey('vwaiter-dropdown');
        final table = find.text('1');
        final saveButton = find.byValueKey('save-settings');

        await driver.waitFor(settingsButton);
        await driver.tap(settingsButton);
        await Future.delayed(Duration(seconds: 2));
        await driver.waitFor(dropdownButton);
        await driver.tap(dropdownButton);
        await Future.delayed(Duration(seconds: 2));
        await driver.waitFor(table);
        await driver.tap(table);
        await Future.delayed(Duration(seconds: 2));
        await driver.waitFor(saveButton);
        await driver.tap(saveButton);
      });
    }); 

    test("special offers page", () async{
      await driver.runUnsynchronized(() async {
        final offerButton = find.byValueKey('blinking-button');
        await driver.waitFor(offerButton);
        await driver.tap(offerButton);
        await Future.delayed(Duration(seconds: 5));
      });
    });

    test("add a special offer to cart", () async{
      final addOfferToCartButton = find.byValueKey("add-offer-Shakes -to-cart");
      await driver.waitFor(addOfferToCartButton);
      await driver.tap(addOfferToCartButton);
      await Future.delayed(Duration(seconds: 2));

      final homeButton = find.byValueKey('homebutton');
      await driver.waitFor(homeButton);
      await driver.tap(homeButton);
      await Future.delayed(Duration(seconds: 2));
    });

    test("scroll on category list", () async{
      await driver.runUnsynchronized(() async {
        final listFinder = find.byValueKey('home-page-cat-list');
        final categoryFinder1 = find.byValueKey('homebutton-Desserts-isHome-true');
        final categoryFinder2 = find.byValueKey('homebutton-Beverages-isHome-true');
        await driver.scrollUntilVisible(
          listFinder,
          categoryFinder1,
          dxScroll: -300.0,
        );
        await driver.scrollUntilVisible(
          listFinder,
          categoryFinder2,
          dxScroll: 300.0,
        );
        await driver.waitFor(categoryFinder2);
        await driver.tap(categoryFinder2);
        await Future.delayed(Duration(seconds: 5));
      });
    });

    test("tap on item", () async{
      final itemList = find.byValueKey('Beverages-category-list');
      final item = find.byValueKey('Herbal Tea');
      await driver.scrollUntilVisible(
          itemList,
          item,
          dyScroll: -150.0,
        );
      await driver.waitFor(item);
      await driver.tap(item);
      await Future.delayed(Duration(seconds: 2));
    });

    test("add an item to cart", () async{
      final increaseQuantity = find.byValueKey('increase-quantity');
      final decreaseQuantity = find.byValueKey('decrease-quantity');
      final addToCart = find.byValueKey('add-item-to-cart');
      await driver.waitFor(increaseQuantity);
      await driver.tap(increaseQuantity);
      await driver.tap(increaseQuantity);
      await Future.delayed(Duration(seconds: 2));

      await driver.waitFor(decreaseQuantity);
      await driver.tap(decreaseQuantity);
      await Future.delayed(Duration(seconds: 2));

      await driver.waitFor(addToCart);
      await driver.tap(addToCart);
      await Future.delayed(Duration(seconds: 2));
    });

    test("check out cart", () async{
      final cartButton = find.byValueKey('cartbutton');
      await driver.waitFor(cartButton);
      await driver.tap(cartButton);
      await Future.delayed(Duration(seconds: 2));
    });

    test("place order", () async{
      final placeButton = find.byValueKey('placebutton');
      await driver.waitFor(placeButton);
      await driver.tap(placeButton);
      await Future.delayed(Duration(seconds: 2));
    });

    test("set a seat", () async{
      final dropdownButton = find.byValueKey('dropdownbuttonformfield');
      final seat = find.text('Seat 1');
      final submitButton = find.byValueKey('submit');

      await driver.waitFor(dropdownButton);
      await driver.tap(dropdownButton);
      await Future.delayed(Duration(seconds: 2));
      await driver.waitFor(seat);
      await driver.tap(seat);
      await Future.delayed(Duration(seconds: 2));
      await driver.waitFor(submitButton );
      await driver.tap(submitButton );
      await Future.delayed(Duration(seconds: 2));
    }); 

    test("add feedback", () async{
      final feedbackButton = find.byValueKey('feedbackbutton');
      await driver.waitFor(feedbackButton);
      await driver.tap(feedbackButton);
      await Future.delayed(Duration(seconds: 2));

      final name = find.byValueKey('name');
      await driver.waitFor(name);
      await driver.tap(name);
      await driver.enterText('Yoshani Ranaweera');
      await driver.waitFor(find.text('Yoshani Ranaweera'));
      await Future.delayed(Duration(seconds: 2));

      final feedback = find.byValueKey('feedback');
      await driver.waitFor(feedback);
      await driver.tap(feedback);
      await driver.enterText('Excellent job');
      await driver.waitFor(find.text('Excellent job'));
      await Future.delayed(Duration(seconds: 2));

      final submitFeedback = find.byValueKey('submitfeedbackbutton');
      await driver.waitFor(submitFeedback);
      await driver.tap(submitFeedback);
      await Future.delayed(Duration(seconds: 5));
    });


  });
}
