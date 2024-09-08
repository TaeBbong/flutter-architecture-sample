import 'package:get/get.dart';
import '../domain/repositories/auth_repository.dart';
import '../presentation/controllers/auth_controller.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/usecases/login_usecase.dart';
import '../domain/usecases/register_usecase.dart';
import 'package:http/http.dart' as http;
import '../data/storage/secure_storage.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(
        AuthController(LoginUseCase(Get.find()), RegisterUseCase(Get.find())),
        permanent: true);
    Get.put<AuthRepository>(AuthRepositoryImpl(http.Client(), SecureStorage()),
        permanent: true);
  }
}
