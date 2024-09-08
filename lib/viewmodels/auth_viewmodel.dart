import 'package:get/get.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

class AuthViewModel extends GetxController {
  final AuthService authService;

  AuthViewModel(this.authService);

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var user = Rxn<User>();

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      user.value = await authService.login(email, password);
      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register(String email, String password) async {
    try {
      isLoading.value = true;
      await authService.register(email, password);
      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
