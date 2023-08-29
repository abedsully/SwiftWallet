class UserModel {
  String? uid;
  String? fullName;
  String? username;
  String? email;

  UserModel({this.uid, this.email, this.fullName, this.username});

  // receiving data from the server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fullName: map['fullName'],
      username: map['username'],
    );
  }

  // sending data to the server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'username': username
    };
  }
}
