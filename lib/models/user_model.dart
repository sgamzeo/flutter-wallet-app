import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String surname;
  final String email;
  final String phoneNumber;
  final String identityNo;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.phoneNumber,
    required this.identityNo,
  });

  // Firebase verilerinden User Nesnesi oluşturur.
  factory User.fromFirestore(Map<String, dynamic> data, String documentId) {
    return User(
      id: documentId,
      name: data['name'] ?? '',
      surname: data['surname'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      identityNo: data['identityNo'] ?? '',
    );
  }

  // User nesnesini Firestore sınıfına dönüştürmek için bir yöntem
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'surname': surname,
      'email': email,
      'phoneNumber': phoneNumber,
      'identityNo': identityNo,
    };
  }
}
