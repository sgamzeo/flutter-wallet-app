// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/service/routes.dart';
import 'package:flutter_wallet_app/viewmodels/signup_viewmodel.dart';

class SignUpAuthView extends StatelessWidget {
  final SignUpViewModel viewModel = SignUpViewModel();

  SignUpAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kaydol'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) => viewModel.email = value,
              decoration: InputDecoration(
                labelText: 'E-posta',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Kayıt Ol butonuna basıldığında yapılacak işlemler burada yer alacak
                Navigator.pushNamed(context, AppRoutes.signupcode);
              },
              child: Text('Kayıt Ol'),
            ),
          ],
        ),
      ),
    );
  }
}
