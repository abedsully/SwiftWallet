class UserModel {
  String? uid;
  String? fullName;
  String? username;
  String? email;
  int? balance;

  UserModel({this.uid, this.email, this.fullName, this.username, this.balance});

  // receiving data from the server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fullName: map['fullName'],
      username: map['username'],
      balance: map['balance'],
    );
  }

  // sending data to the server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'username': username,
      'balance': balance,
    };
  }
}
