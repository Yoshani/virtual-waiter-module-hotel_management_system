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
      final timeline = await driver.traceAction(() async {
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
      });
      final summary = new TimelineSummary.summarize(timeline);
      summary.writeSummaryToFile('login_summary', pretty: true);

    });


    test("view empty cart", () async{
      await driver.runUnsynchronized(() async {
        final cartButton = find.byValueKey('cartbutton');
        await driver.waitFor(cartButton);
        await driver.tap(cartButton);
      });
    });

    test("view empty order status tab", () async{
        final statusButton = find.byValueKey('statusbutton');
        await driver.waitFor(statusButton);
        await driver.tap(statusButton);
    });

    test("view feedback tab", () async{
        final feedbackButton = find.byValueKey('feedbackbutton');
        await driver.waitFor(feedbackButton);
        await driver.tap(feedbackButton);
    });

    test("navigate to home", () async{
      final homeButton = find.byValueKey('homebutton');
      await driver.waitFor(homeButton);
      await driver.tap(homeButton);
    });

    test("change virtual waiter settings", () async{
      final timeline = await driver.traceAction(() async {
        await driver.runUnsynchronized(() async {
          final settingsButton = find.byValueKey('vwaiter-settings');
          final dropdownButton = find.byValueKey('vwaiter-dropdown');
          final table = find.text('1');
          final saveButton = find.byValueKey('save-settings');

          await driver.waitFor(settingsButton);
          await driver.tap(settingsButton);
          await driver.waitFor(dropdownButton);
          await driver.tap(dropdownButton);
          await driver.waitFor(table);
          await driver.tap(table);
          await driver.waitFor(saveButton);
          await driver.tap(saveButton);
        });
      });
      final summary = new TimelineSummary.summarize(timeline);
      summary.writeSummaryToFile('vwaiter_settings_summary', pretty: true);
    }); 

    test("special offers page", () async{
      final timeline = await driver.traceAction(() async {
        await driver.runUnsynchronized(() async {
          final offerButton = find.byValueKey('blinking-button');
          await driver.waitFor(offerButton);
          await driver.tap(offerButton);
        });
      });
      final summary = new TimelineSummary.summarize(timeline);
      summary.writeSummaryToFile('button_press_summary', pretty: true);
    });

    test("add a special offer to cart", () async{
      final timeline = await driver.traceAction(() async {
        final addOfferToCartButton = find.byValueKey("add-offer-0-to-cart");
        await driver.waitFor(addOfferToCartButton);
        await driver.tap(addOfferToCartButton);
      });
      final summary = new TimelineSummary.summarize(timeline);
      summary.writeSummaryToFile('add_item_to_cart_summary', pretty: true);

      final homeButton = find.byValueKey('homebutton');
      await driver.waitFor(homeButton);
      await driver.tap(homeButton);
    });

    test("scroll on category list", () async{     
      await driver.runUnsynchronized(() async {     
        final listFinder = find.byValueKey('home-page-cat-list');
        final categoryFinder1 = find.byValueKey('homebutton-5');
        final categoryFinder2 = find.byValueKey('homebutton-2');
        final timeline = await driver.traceAction(() async {
          await driver.scrollUntilVisible(
            listFinder,
            categoryFinder1,
            dxScroll: -300.0,
          );
        });
        final summary = new TimelineSummary.summarize(timeline);
        summary.writeSummaryToFile('scrolling_summary', pretty: true);
        await driver.scrollUntilVisible(
          listFinder,
          categoryFinder2,
          dxScroll: 300.0,
        );
        await driver.waitFor(categoryFinder2);
        await driver.tap(categoryFinder2);
      });
    });

    test("tap on item", () async{
      final itemList = find.byValueKey('category-list-2');
      final item = find.byValueKey('item-3');
      await driver.scrollUntilVisible(
          itemList,
          item,
          dyScroll: -150.0,
      );
      await driver.waitFor(item);
      await driver.tap(item);
    });

    test("add an item to cart", () async{
      final increaseQuantity = find.byValueKey('increase-quantity');
      final decreaseQuantity = find.byValueKey('decrease-quantity');
      final addToCart = find.byValueKey('add-item-to-cart');
      await driver.waitFor(increaseQuantity);
      await driver.tap(increaseQuantity);
      await driver.tap(increaseQuantity);

      await driver.waitFor(decreaseQuantity);
      await driver.tap(decreaseQuantity);

      await driver.waitFor(addToCart);
      await driver.tap(addToCart);
    });

    test("check out cart", () async{
      final cartButton = find.byValueKey('cartbutton');
      await driver.waitFor(cartButton);
      await driver.tap(cartButton);
    });

    test("place order", () async{
      final timeline = await driver.traceAction(() async {
        final placeButton = find.byValueKey('placebutton');
        await driver.waitFor(placeButton);
        await driver.tap(placeButton);
      });
      final summary = new TimelineSummary.summarize(timeline);
      summary.writeSummaryToFile('place_order_summary', pretty: true);
    });

    test("set a seat", () async{     
      final dropdownButton = find.byValueKey('dropdownbuttonformfield');
      final seat = find.text('Seat 1');
      final submitButton = find.byValueKey('submit');

      final timeline = await driver.traceAction(() async {
        await driver.waitFor(dropdownButton);
        await driver.tap(dropdownButton);

        await driver.waitFor(seat);
        await driver.tap(seat);

        await driver.waitFor(submitButton );
        await driver.tap(submitButton );
      }); 
      final summary = new TimelineSummary.summarize(timeline);
      summary.writeSummaryToFile('set_seat_summary', pretty: true);
      await Future.delayed(Duration(seconds:5));
    }); 

    test("add feedback", () async{
      final feedbackButton = find.byValueKey('feedbackbutton');
      await driver.waitFor(feedbackButton);
      await driver.tap(feedbackButton);

      final name = find.byValueKey('name');
      await driver.waitFor(name);
      await driver.tap(name);
      await driver.enterText('Driver test');
      await driver.waitFor(find.text('Driver test'));

      final feedback = find.byValueKey('feedback');
      await driver.waitFor(feedback);
      await driver.tap(feedback);
      await driver.enterText('Test in progress');
      await driver.waitFor(find.text('Test in progress'));

      final timeline = await driver.traceAction(() async {
        final submitFeedback = find.byValueKey('submitfeedbackbutton');
        await driver.waitFor(submitFeedback);
        await driver.tap(submitFeedback);
      });
      final summary = new TimelineSummary.summarize(timeline);
      summary.writeSummaryToFile('submit_feedback_summary', pretty: true);
      await Future.delayed(Duration(seconds:5));
    });


  });
}
