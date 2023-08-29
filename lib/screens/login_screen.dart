import 'package:e_wallet/screens/home_screen.dart';
import 'package:e_wallet/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  bool _obscureText = true;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: email,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        return null;
      },
      onSaved: (value) {
        email.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
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
            validator: (value) {
              if (value!.isEmpty) {
                return ("Password is required for login");
              }
            },
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

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromRGBO(242, 174, 100, 1),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: double.infinity,
        onPressed: () {
          signIn(email.text, password.text);
        },
        child: Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    final registerLink = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account?"),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterScreen(),
              ),
            ),
          )
        ],
      ),
    );

    return Scaffold(
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
                    emailField,
                    SizedBox(height: 30),
                    passwordField,
                    SizedBox(height: 30),
                    loginButton,
                    SizedBox(height: 30),
                    registerLink,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) => HomeScreen()))),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
