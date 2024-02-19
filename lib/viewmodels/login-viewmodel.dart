// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/service/firebase_auth.dart';
import 'package:flutter_wallet_app/service/routes.dart';

class LoginViewModel extends ChangeNotifier {
  bool _emailExists = false;
  bool _passwordCorrect = false;

  bool get emailExists => _emailExists;
  bool get passwordCorrect => _passwordCorrect;

  Future<bool> checkEmailExists(String email) async {
    _emailExists = await FirebaseAuthService().checkEmailExists(email);
    notifyListeners();
    return _emailExists;
  }

  Future<bool> checkPassword(String email, String password) async {
    _passwordCorrect = await FirebaseAuthService().checkPassword(email, password);
    notifyListeners();
    return _passwordCorrect;
  }

  Future<void> signIn(BuildContext context, String email) async {
    bool emailExists = await checkEmailExists(email);
    if (emailExists && _passwordCorrect) {
      if (AppRoutes.routes.containsKey(AppRoutes.wallet)) {
        Navigator.pushNamed(
          context,
          AppRoutes.wallet,
          arguments: email,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Giriş yapılamadı: Geçersiz rota.'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('E-posta adresi veya şifre hatalı.'),
        ),
      );
    }
  }
}
