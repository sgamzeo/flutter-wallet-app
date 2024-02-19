// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpViewModel extends ChangeNotifier {
  late String _email;

  String get email => _email;

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  bool isEmailValid(String email) {
    // E-posta adresi için geçerli bir regex deseni
    RegExp emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    // Verilen metin e-posta formatına uygun mu kontrol ediyoruz
    return emailPattern.hasMatch(email);
  }

  void goToVerificationCode(BuildContext context) {
    // E-posta formatının doğru olup olmadığını kontrol ediyoruz
    if (!isEmailValid(_email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Geçersiz e-posta adresi'),
        ),
      );
      return;
    }

    // Eğer e-posta formatı doğru ise, doğrulama kodu ekranına geçiş yap
    Navigator.pushNamed(
      context,
      '/signupcode',
      arguments: _email,
    );
  }

  bool isCodeCorrect(String enteredCode) {
  return enteredCode == "123456";
}


}
