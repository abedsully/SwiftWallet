import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              Text("Welcome Back"),
              SizedBox(height: 10),
              Text("Name"),
              Text("Email"),
              SizedBox(height: 10),
              ActionChip(
                label: Text("Logout"),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
