import 'package:get/get_utils/get_utils.dart';

String? validatePassword(String password) {
  if (password.length < 6) {
    return 'Password must be at least 6 characters long';
  }
  return null;
}

String? validateEmail(String email) {
  if (!GetUtils.isEmail(email)) {
    return 'Enter a valid email';
  }
  return null;
}
