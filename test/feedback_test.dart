import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_system/screens/virtual_waiter/feedback.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

void main() {

  testWidgets('Feedback page test',(WidgetTester tester) async {
    //adjust test screen size
    tester.binding.window.physicalSizeTestValue = Size(1536, 2048);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    // resets the screen to its original size after the test end
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

    await tester.pumpWidget(
        MaterialApp(
        home: CustomerFeedback(),
      ),
    );
    await tester.pumpAndSettle();
    //finds test widget
    expect(find.byType(CustomerFeedback), findsOneWidget);

    //finds feedback page UI
    expect(find.text("          Give us your feedback!        "), findsOneWidget);
    expect(find.byType(TextFormField), findsWidgets);
    expect(find.text("Enter your name"), findsOneWidget);
    expect(find.text("What do you think about Pearl Hotel Restaurant?"), findsOneWidget);
    expect(find.text("We'd love to hear from you!"), findsOneWidget);
    expect(find.text("Rate us"), findsOneWidget);
    expect(find.byType(SmoothStarRating), findsOneWidget);
    expect(find.text("Submit"), findsOneWidget);
    expect(find.text("Skip"), findsOneWidget);
    expect(find.byType(RaisedButton), findsWidgets);

  // Enter 'CustomerName' into the name TextField.
  await tester.enterText(find.byKey(Key('name')), 'CustomerName');

  // Enter 'CustomerFeedback' into the feedback TextField.
  await tester.enterText(find.byKey(Key('feedback')), 'CustomerFeedback');

  await tester.pump();
  expect(find.text('CustomerName'), findsOneWidget);
  expect(find.text('CustomerFeedback'), findsOneWidget);

  await tester.tap(find.byKey(Key('submitfeedbackbutton')));
  await tester.pumpAndSettle(Duration(seconds: 6));
  print("Submit button pressed");

  await tester.tap(find.byKey(Key('skipfeedbackbutton')));
  await tester.pump();
  await tester.pumpAndSettle();
  print("Skip button pressed");

  });
}
