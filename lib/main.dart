import 'package:flutter/material.dart';
import 'pages/sign_up_page.dart';
import 'styles/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: SignUpPage(),
    );
  }
}
