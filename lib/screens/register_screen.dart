import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();

  final fullName = new TextEditingController();
  final username = new TextEditingController();
  final email = new TextEditingController();
  final password = new TextEditingController();
  final confirm = new TextEditingController();




  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('Hello'),
    );
  }
}
