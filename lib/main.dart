import 'package:e_wallet/screens/home_screen.dart';
import 'package:e_wallet/screens/login_screen.dart';
import 'package:e_wallet/screens/register_screen.dart';
import 'package:e_wallet/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Wallet',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(242, 174, 100, 0.5),
          ),
        ),
        home: const SplashScreen());
  }
}
