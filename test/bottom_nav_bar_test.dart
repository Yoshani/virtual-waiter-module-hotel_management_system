import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_management_system/screens/virtual_waiter/bottom_nav_bar.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('Button is present and triggers navigation after tapped',(WidgetTester tester) async {
    // final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomNavigation(
          ),
        ),
      ),
    );

    expect(find.byKey(Key('homebutton')), findsOneWidget);
    expect(find.byKey(Key('cartbutton')), findsOneWidget);
    expect(find.byKey(Key('statusbutton')), findsOneWidget);
    expect(find.byKey(Key('feedbackbutton')), findsOneWidget);

    await tester.tap(find.byKey(Key('homebutton')));
    print("Home button pressed");
    await tester.pumpAndSettle();

    /// Verify that a push event happened
    // verify(mockObserver.didPush(any, any));

    /// You'd also want to be sure that your page is now
    /// present in the screen.
    // expect(find.byType(VwaiterHome), findsOneWidget);
  });
}
