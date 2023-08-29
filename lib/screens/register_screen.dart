import 'package:e_wallet/screens/login_screen.dart';
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
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final fullNameField = TextFormField(
      autofocus: false,
      controller: fullName,
      // validator: (value) {},
      onSaved: (value) {
        fullName.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_box),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Full Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final usernameField = TextFormField(
      autofocus: false,
      controller: username,
      // validator: (value) {},
      onSaved: (value) {
        username.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Username',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: email,
      keyboardType: TextInputType.emailAddress,
      // validator: (value) {},
      onSaved: (value) {
        email.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email_outlined),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final passwordField = Stack(
      children: [
        Container(
          child: TextFormField(
            autofocus: false,
            controller: password,
            obscureText: _obscureText,
            // validator: (value) {},
            onSaved: (value) {
              password.text = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.vpn_key),
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          ),
        )
      ],
    );

    final confirmPasswordField = Stack(
      children: [
        Container(
          child: TextFormField(
            autofocus: false,
            controller: confirm,
            obscureText: _obscureText,
            // validator: (value) {},
            onSaved: (value) {
              confirm.text = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.vpn_key),
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: 'Confirm Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          ),
        )
      ],
    );

    final registerButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromRGBO(242, 174, 100, 1),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: double.infinity,
        onPressed: () {},
        child: Text(
          'Register',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 30),
                    fullNameField,
                    SizedBox(height: 15),
                    usernameField,
                    SizedBox(height: 15),
                    emailField,
                    SizedBox(height: 15),
                    passwordField,
                    SizedBox(height: 15),
                    confirmPasswordField,
                    SizedBox(height: 30),
                    registerButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
