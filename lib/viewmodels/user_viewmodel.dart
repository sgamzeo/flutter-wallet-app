import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';

import 'package:flutter_wallet_app/service/firebase_auth.dart';
import 'package:flutter_wallet_app/service/firebase_auth_service.dart';

class UserViewModel extends ChangeNotifier {
  final FirebaseAuthService _authService = FirebaseAuthService();

  firebase_auth.User? _currentUser; // Değişiklik burada

  // Mevcut kullanıcıyı döndürür
  firebase_auth.User? get currentUser => _currentUser;

  // Kullanıcıyı kaydeder
  Future<void> signUpUser({
    required String name,
    required String surname,
    required String identityNo,
    required String phoneNumber,
    required String email,
    required String password,
    required double initialBalance,
  }) async {
    try {
      // Kullanıcıyı Firebase Authentication ile kaydeder
      await _authService.signUpWithEmailAndPassword(email, password);

      // Kullanıcı Firestore'a kaydedilir
      await _authService.signUpUser(
        name: name,
        surname: surname,
        identityNo: identityNo,
        phoneNumber: phoneNumber,
        initialBalance: initialBalance,
      );

      // Mevcut kullanıcıyı ayarla
      _currentUser = firebase_auth.FirebaseAuth.instance.currentUser; // Değişiklik burada

      notifyListeners();
    } catch (e) {
      // Hata durumunda işlemler burada yönetilebilir
      print('Kullanıcı kaydı sırasında bir hata oluştu: $e');
      throw Exception('Kullanıcı kaydı başarısız oldu.');
    }
  }
}
