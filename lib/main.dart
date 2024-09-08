import 'package:get/get.dart';

import '../bindings/auth_binding.dart';
import 'package:flutter/material.dart';
import 'views/sign_up_page.dart';
import 'styles/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AuthBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      home: SignUpPage(),
    );
  }
}
