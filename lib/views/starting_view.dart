// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/service/routes.dart'; // AppRoutes'ı doğru yoldan import ettiğinizden emin olun

class StartingView extends StatelessWidget {
  const StartingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Starting View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.signup); // Kaydol sayfasına git
              },
              child: Text('Kaydol'),
            ),
            SizedBox(height: 20), // Araya boşluk ekleyelim
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login); // Giriş yap sayfasına git
              },
              child: Text('Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }
}
