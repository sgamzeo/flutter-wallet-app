// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/components/auth_top.dart';
import 'package:flutter_wallet_app/components/button.dart';
import 'package:flutter_wallet_app/components/pin_fields.dart';
import 'package:flutter_wallet_app/components/text_divider.dart';

import 'package:flutter_wallet_app/service/firebase_auth.dart';
import 'package:flutter_wallet_app/service/routes.dart';

class LoginPasswordView extends StatelessWidget {
  final String email; // Önceki ekrandan alınan e-posta adresi

  const LoginPasswordView({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String enteredPassword = ''; // Kullanıcının girdiği şifreyi tutacak değişken

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthPageInfo(
              title: 'Giriş yap', description: '',
             
            ),
            Expanded(
              child: Center(
                child: VerificationCodeInput(
                  length: 6,
                  onChanged: (value) {
                    enteredPassword = value; // Şifre değiştiğinde güncellemek için
                  },
                  onCompleted: (value) {
                    // Burada tüm şifre girildiğinde yapılacak işlemleri belirleyebilirsiniz
                  },
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(
                  text: 'Giriş yap',
                  textColor: Colors.black,
                  onPressed: () async {
                    bool isPasswordCorrect = await FirebaseAuthService().checkPassword(email, enteredPassword);
                    if (isPasswordCorrect) {
                      // Eğer şifre doğruysa, WalletView'e yönlendir
                      Navigator.pushNamed(context, AppRoutes.wallet);
                    } else {
                      // Eğer şifre yanlışsa, hata mesajı göster
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Şifre hatalı. Lütfen tekrar deneyin.'),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 10),
                TextDivider(text: "veya"),
                SizedBox(height: 10),
                Button(
                  text: 'Google ile devam et',
                  onPressed: () {
                    // Butona tıklandığında yapılacak işlemler
                  },
                  backgroundColor: Colors.red,
                ),
                SizedBox(height: 10),
                Button(
                  text: 'Apple ile devam et',
                  icon: Icons.add,
                  onPressed: () {
                    // Butona tıklandığında yapılacak işlemler
                  },
                  backgroundColor: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
