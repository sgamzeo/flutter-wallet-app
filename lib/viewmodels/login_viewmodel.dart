import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  String _email = '';
  String _password = '';

  // Getters ve setters

  String get email => _email;
  set email(String value) {
    _email = value;
    notifyListeners();
  }

  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  // Giriş işlemi
  Future<void> login(BuildContext context) async {
    try {
      // Firebase Authentication ile kullanıcı girişi yapılır
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      
      // Giriş başarılıysa bir sonraki adıma geçilebilir
      // Örneğin, ana sayfaya yönlendirme yapılabilir

      print('Giriş başarılı: $_email');
    } catch (error) {
      // Giriş işlemi başarısız olursa hata mesajı gösterilebilir
      print('Giriş işlemi başarısız: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Giriş başarısız: $error'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
