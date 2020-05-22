import 'package:hotel_management_system/screens/authenticate/register.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('empty email returns error string', () {

    final result = EmailFieldValidator.validate('');
    expect(result, 'Email can\'t be empty');
  });

  test('non-empty email returns null', () {

    final result = EmailFieldValidator.validate('email');
    expect(result, null);
  });

  test('empty password returns error string', () {

    final result = PasswordFieldValidator.validate('');
    expect(result, 'Enter a password 6+ characters long');
  });

  test('6+ characters long password returns null', () {

    final result = PasswordFieldValidator.validate('password');
    expect(result, null);
  });
}