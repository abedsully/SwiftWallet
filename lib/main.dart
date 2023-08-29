import 'package:e_wallet/screens/login_screen.dart';
import 'package:e_wallet/screens/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'E-Wallet',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(242, 174, 100, 0.5),
          ),
        ),
        home: const RegisterScreen());
  }
}
