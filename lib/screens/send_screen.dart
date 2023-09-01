import 'package:e_wallet/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

class UserModels {
  final String? username;
  final int? balance;

  UserModels(this.username, this.balance);
}

class UserCard extends StatelessWidget {
  final UserModels user;

  UserCard(this.user);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(user.username ?? ""),
          // Add more widgets to display additional user information
        ],
      ),
    );
  }
}

class SendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen())),
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          title: Text('Send Screen'),
        ),
        body: UserList(),
      ),
    );
  }
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        List<UserModels> users = snapshot.data!.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return UserModels(data['username'], data['balance']);
        }).toList();

        List<Widget> userCards = users.map((user) {
          return Container(
            height: 100,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromRGBO(245, 152, 53, 0.498),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Username: ${user.username ?? "a"}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(onPressed: () {}, child: Text('Send Money')),
              ],
            ),
          );
        }).toList();

        return SingleChildScrollView(
          child: Column(
            children: userCards,
          ),
        );
      },
    );
  }
}
