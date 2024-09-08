import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../storage/secure_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final http.Client client;
  final SecureStorage secureStorage;

  AuthRepositoryImpl(this.client, this.secureStorage);

  @override
  Future<User?> login(String email, String password) async {
    final response = await client.post(
      Uri.parse('https://api.example.com/login'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final user =
          User(id: json['id'], email: json['email'], token: json['token']);
      await secureStorage.write(key: 'token', value: user.token); // 토큰 저장
      return user;
    } else {
      throw Exception('Failed to login');
    }
  }

  @override
  Future<void> register(String email, String password) async {
    final response = await client.post(
      Uri.parse('https://api.example.com/register'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to register');
    }
  }
}
