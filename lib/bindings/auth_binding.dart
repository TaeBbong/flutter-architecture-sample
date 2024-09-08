import 'package:get/get.dart';
import '../services/auth_service.dart';
import '../viewmodels/auth_viewmodel.dart';
import 'package:http/http.dart' as http;
import '../utils/secure_storage.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthViewModel>(
        () => AuthViewModel(AuthService(http.Client(), SecureStorage())));
  }
}
