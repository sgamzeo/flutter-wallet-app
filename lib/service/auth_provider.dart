import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;

  // Kullanıcının oturum durumunu 
  bool get isAuthenticated => _isAuthenticated;

  // Oturumu başlatır
  void signIn() {
    _isAuthenticated = true;
    notifyListeners();
  }

  // Oturumu sonlandırır
  void signOut() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
 