// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/service/firebase_auth.dart'; // Database servisini dahil edin
import 'package:flutter_wallet_app/service/routes.dart';

import '../../components/button.dart';

class LoginAuthView extends StatelessWidget {
  const LoginAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = ''; // Kullanıcının girdiği e-posta adresini tutacak değişken

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Diğer widget'lar buraya eklenecek

            // Kullanıcıdan e-posta girmesini isteyen TextField
            TextField(
              onChanged: (value) {
                email = value; // TextField'dan gelen e-posta adresini al
              },
              decoration: InputDecoration(
                labelText: 'E-posta',
              ),
            ),

            // Giriş yap butonu
            Button(
              text: 'Giriş yap',
              textColor: Colors.black,
              onPressed: () async {
                // E-postanın var olup olmadığını kontrol etmeden önce e-postayı alın
                bool emailExists =
                    await FirebaseAuthService().checkEmailExists(email);

                if (emailExists) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('E-posta doğru'),
                    ),
                  );
                  // Eğer e-posta varsa, şifreyi kontrol etmek için pin ekranına git
                  Navigator.pushNamed(
                    context,
                    AppRoutes.pin,
                    arguments:
                        email, // Girilen e-posta adresini pin ekranına argüman olarak geçir
                  );
                } else {
                  // Eğer e-posta yoksa hata mesajı göster
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'E-posta adresi bulunamadı. Lütfen geçerli bir adres giriniz.',
                      ),
                    ),
                  );
                }
              },
            ),

            // Diğer widget'lar buraya eklenecek
          ],
        ),
      ),
    );
  }
}
