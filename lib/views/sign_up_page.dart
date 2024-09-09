import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodels/auth_viewmodel.dart';
import '../utils/validators.dart';

class SignUpPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Get.find<AuthViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 40),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: validateEmail(emailController.text),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: validatePassword(passwordController.text),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                errorText:
                    passwordController.text != confirmPasswordController.text
                        ? 'Passwords do not match'
                        : null,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Obx(() => authViewModel.isLoading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        authViewModel.register(
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )),
            ),
            const SizedBox(height: 20),
            Obx(() => authViewModel.user.value != null
                ? Text('Welcome, ${authViewModel.user.value!.email}')
                : Text(authViewModel.errorMessage.value,
                    style: const TextStyle(color: Colors.red))),
          ],
        ),
      ),
    );
  }
}
