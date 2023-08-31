import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_wallet/model/user_model.dart';
import 'package:e_wallet/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({super.key});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  final TextEditingController nominalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nominalField = TextFormField(
      controller: nominalController,
      decoration: InputDecoration(
        hintText: 'Top Up Nominal',
      ),
    );

    final topUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromRGBO(242, 174, 100, 1),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: double.infinity,
        onPressed: () async {
          String enteredValue = nominalController.text;
          if (enteredValue.isNotEmpty) {
            int? topUpValue = int.tryParse(enteredValue);
            if (topUpValue! < 20000) {
              Fluttertoast.showToast(msg: "Minimum top up is 20000");
              return;
            }
            if (topUpValue != null) {
              UserModel currentUser = await fetchUserData(user!.uid);
              int currentBalance = currentUser.balance ?? 0;

              int newBalance = currentBalance + topUpValue;

              await FirebaseFirestore.instance
                  .collection("users")
                  .doc(user!.uid)
                  .update({"balance": newBalance}).then((_) {
                setState(() {
                  loggedInUser.balance = newBalance;
                });
              });

              Fluttertoast.showToast(msg: "Top up ${topUpValue} successful !");

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false,
              );
            } else {
              Fluttertoast.showToast(msg: "Please insert the right value");
            }
          } else {
            Fluttertoast.showToast(msg: "Please insert some value");
          }
        },
        child: const Text(
          'Top Up',
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
        title: Text('Top Up Balance'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              nominalField,
              SizedBox(height: 20),
              topUpButton,
            ],
          ),
        ),
      ),
    );
  }

  Future<UserModel> fetchUserData(String uid) async {
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    if (userSnapshot.exists) {
      return UserModel.fromMap(userSnapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception('User not found');
    }
  }
}
