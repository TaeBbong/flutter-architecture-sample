import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/auth_bindings.dart';
import 'presentation/pages/sign_up_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AuthBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SignUpPage(),
    );
  }
}
