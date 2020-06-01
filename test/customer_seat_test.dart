import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_management_system/screens/virtual_waiter/customer_seat.dart';
import 'package:hotel_management_system/services/auth.dart';
import 'package:mockito/mockito.dart';
// PositionForm(subtotal: 100, total: 100, onCartChanged: (){})

void main(){
  Future<void> pumpArgumentWidget(
    WidgetTester tester, {
    @required Object args,
    @required Widget child,
  }) async {
    final key = GlobalKey<NavigatorState>();
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: key,
        home: FlatButton(
          onPressed: () => key.currentState.push(
            MaterialPageRoute<void>(
              settings: RouteSettings(arguments: args),
              builder: (_) => child
            ),
          ),
          child: const SizedBox(),
        ),
      ),
    );

    testWidgets('test seat', (WidgetTester tester) async{
      await pumpArgumentWidget(tester, args: null, child: null);
      await tester.tap(find.byType(FlatButton));
      await tester.pumpAndSettle();
    });

     // Might need to be removed when testing infinite animations
    // expect(find.byType(PositionForm), findsOneWidget);  
  }
}