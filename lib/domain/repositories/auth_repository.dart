import '../entities/user.dart';

abstract class AuthRepository {
  Future<User?> login(String email, String password); // User를 반환
  Future<void> register(String email, String password);
}
