import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_wallet/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({super.key});

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  List<UserModel> otherUsers = [];

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  // Function to fetch data of other users
  Future<void> fetchUserData() async {
    // Reference to the Firestore collection containing user data
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    // Query Firestore to retrieve data of other users (you can customize the query as needed)
    QuerySnapshot querySnapshot = await usersCollection.get();

    // Iterate through the documents in the query result
    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      // Access user data from the document
      Map<String, dynamic> userData =
          documentSnapshot.data() as Map<String, dynamic>;

      // Create UserModel objects and add them to the list
      UserModel otherUser = UserModel(
        // Customize this based on your user model structure
        username: userData['username'],
      );
      otherUsers.add(otherUser);
    }

    // Update the UI when data is fetched
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Money"),
      ),
      body: ListView(
        children: otherUsers.map((user) {
          return Container(
            margin: EdgeInsets.all(20),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromRGBO(245, 152, 53, 0.498),
            ),
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${user.username}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: Text('Send Money')),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
