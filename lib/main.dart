import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const AppSalao());
}

class AppSalao extends StatelessWidget {
  const AppSalao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Salão',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}
