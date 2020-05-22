import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_management_system/screens/virtual_waiter/feedback.dart';

void main() {

  test('empty name returns error string', () {

    final result = NameFieldValidator.validate('');
    expect(result, 'Please enter a name');
  });

  test('non-empty name returns null', () {

    final result = NameFieldValidator.validate('Yoshani');
    expect(result, null);
  });

  test('empty feedback returns error string', () {

    final result = FeedbackFieldValidator.validate('');
    expect(result, 'Please enter your feedback');
  });

  test('non-empty feedback returns null', () {

    final result = FeedbackFieldValidator.validate('excellent');
    expect(result, null);
  });
}