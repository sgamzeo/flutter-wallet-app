// import 'package:flutter/material.dart';

// // AuthProvider sınıfı
// class AuthProvider extends ChangeNotifier {
//   String? _loggedInUserId; // Oturum açmış kullanıcının kimliği

//   // Oturum açmış kullanıcının kimliğini döndüren metot
//   String? get loggedInUserId => _loggedInUserId;

//   // Kullanıcı oturumunu başlatan metot
//   void signIn(String email, String password) {
//     // Kullanıcı doğrulama işlemi burada gerçekleştirilir
//     // Örneğin, Firebase Authentication gibi bir servisi kullanabilirsiniz

//     // Sabit kullanıcı bilgileri
//     const String validEmail = 'test@test.com';
//     const String validPassword = '123456';

//     // Verilen e-posta ve parolanın doğruluğunu kontrol et
//     if (email == validEmail && password == validPassword) {
//       // Eğer verilen bilgiler doğru ise, kullanıcı oturumu başlat
//       _loggedInUserId = '123'; // Sabit bir kullanıcı kimliği atıyoruz
//       notifyListeners(); // Değişiklikleri dinleyen widget'lara haber verir
//     } else {
//       // Eğer verilen bilgiler doğru değilse, kullanıcı oturumu başlatılamaz
//       _loggedInUserId = null;
//     }
//   }
// }


import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _loggedInUserId; // Oturum açmış kullanıcının kimliği

  // Oturum açmış kullanıcının kimliğini döndüren metot
  String? get loggedInUserId => _loggedInUserId;

  // Kullanıcı oturumunu başlatan metot
  Future<void> signIn(String email, String password) async {
    // Kullanıcı doğrulama işlemi burada gerçekleştirilir
    // Örneğin, Firebase Authentication gibi bir servisi kullanabilirsiniz

    // Sabit kullanıcı bilgileri
    const String validEmail = 'test@test.com';
    const String validPassword = '123456';

    // Verilen e-posta ve parolanın doğruluğunu kontrol et
    if (email == validEmail && password == validPassword) {
      // Eğer verilen bilgiler doğru ise, kullanıcı oturumu başlat
      _loggedInUserId = '123'; // Sabit bir kullanıcı kimliği atıyoruz
      notifyListeners(); // Değişiklikleri dinleyen widget'lara haber verir
    } else {
      // Eğer verilen bilgiler doğru değilse, kullanıcı oturumu başlatılamaz
      _loggedInUserId = null;
    }
  }
}

