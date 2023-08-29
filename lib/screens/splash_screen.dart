import 'dart:async';
import 'package:e_wallet/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.push(
        context, MaterialPageRoute(builder: (content) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Lottie.network(
                  'https://lottie.host/e6d75edf-81e8-40f2-9cb1-ac15618168b4/Ep6lZqASS9.json'),
              width: 300,
            ),
          ),
          Text(
            'Swift Wallets',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          )
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

Widget content() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: Container(
          child: Lottie.network(
              'https://lottie.host/e6d75edf-81e8-40f2-9cb1-ac15618168b4/Ep6lZqASS9.json'),
          width: 300,
        ),
      ),
      Text(
        'Swift Wallets',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      )
    ],
  );
}
