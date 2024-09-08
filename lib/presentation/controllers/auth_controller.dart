import 'package:get/get.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var user = Rxn<User>(); // User 객체를 상태로 관리

  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthController(this.loginUseCase, this.registerUseCase);

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      final result = await loginUseCase.execute(email, password);
      if (result != null) user.value = result; // 로그인 성공 시 user 업데이트
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register(String email, String password) async {
    try {
      isLoading.value = true;
      await registerUseCase.execute(email, password);
      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  String? validateEmail(String email) {
    if (!GetUtils.isEmail(email)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}
