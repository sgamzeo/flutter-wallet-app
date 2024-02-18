// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wallet_app/components/auth_top.dart';
import 'package:flutter_wallet_app/components/button.dart';
import 'package:flutter_wallet_app/components/text_divider.dart';
import 'package:flutter_wallet_app/components/text_field.dart';
import 'package:flutter_wallet_app/service/auth_provider.dart'; // AuthProvider import edildi
import 'package:flutter_wallet_app/service/routes.dart';

class LoginAuthView extends StatelessWidget {
  const LoginAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthPageInfo(
              title: 'Giriş yap',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
            ),
            Expanded(
              child: Center(
                child: VerificationCodeTextInput(
                  length: 64,
                  onChanged: (value) {
                    // Burada verification code değiştiğinde yapılacak işlemleri belirleyebilirsiniz
                  },
                  onCompleted: (value) {
                    // Burada tüm verification code girildiğinde yapılacak işlemleri belirleyebilirsiniz
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
                  onPressed: () {
                    // AuthProvider'ı kullanarak giriş işlemini gerçekleştir
                    print("giriş yap butonu tıklandı");
                    Provider.of<AuthProvider>(context, listen: false)
                        .signIn('test@test.com', '123456');
                        Navigator.pushNamed(context, AppRoutes.pin);
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
