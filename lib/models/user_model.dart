import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userID;
  final String email;
  String username;
  String profileURL;
  double balance;
  DateTime createdAt;
  DateTime updatedAt;

  UserModel({
    required this.userID,
    required this.email,
    required this.username,
    this.profileURL = '',
    this.balance = 0.0, // Başlangıç için
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email,
      'username': username,
      'profileURL': profileURL,
      'balance': balance,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt': updatedAt ?? FieldValue.serverTimestamp(),
    };
  }

  UserModel.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        email = map['email'],
        username = map['username'],
        profileURL = map['profileURL'],
        balance = map['balance'],
        createdAt = (map['createdAt'] as Timestamp).toDate(),
        updatedAt = (map['updatedAt'] as Timestamp).toDate();
}
