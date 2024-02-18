import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool _userExists = false; // Kullanıcının varlığını temsil eden bir değişken

  bool get userExists => _userExists;

  // Kullanıcı varlığını kontrol etmek için bir fonksiyon
  void checkIfUserExists(String email) {
    // Burada kullanıcının veritabanında kayıtlı olup olmadığını kontrol edecek kodları yazabilirsiniz
    // Örneğin, gerçek bir veritabanı sorgusu gerçekleştirilebilir veya başka bir doğrulama işlemi yapılabilir
    // Bu sadece bir örnek olduğu için, varsayılan olarak false dönüyoruz
    // Gerçek bir uygulamada, bu kısmı gerçek veritabanı sorgusu ile değiştirmeniz gerekecek
    // Bu örnekte, e-posta adresinin geçerli olup olmadığını kontrol ediyoruz
    if (isValidEmail(email)) {
      // Eğer e-posta adresi geçerliyse, kullanıcı var olarak işaretlenir
      _userExists = true;
    } else {
      // Eğer e-posta adresi geçerli değilse, kullanıcı yok olarak işaretlenir
      _userExists = false;
    }
    notifyListeners(); // Değişiklikleri dinleyen widget'lara haber verir
  }

  // E-posta adresinin geçerli olup olmadığını kontrol eden yardımcı bir fonksiyon
  bool isValidEmail(String email) {
    // Gerçek bir e-posta adresi doğrulama mantığı burada yer alabilir
    // Bu örnekte, sadece "@" sembolünün varlığını kontrol ediyoruz
    return email.contains('@');
  }
}
