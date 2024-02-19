// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/viewmodels/signup_viewmodel.dart';

class VerificationCodeView extends StatefulWidget {
  final String email;

  const VerificationCodeView({Key? key, required this.email}) : super(key: key);

  @override
  _VerificationCodeViewState createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
  String enteredCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doğrulama Kodu'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Doğrulama kodunu e-postanıza gönderdik: ${widget.email}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  enteredCode = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Doğrulama Kodu',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                bool isCodeCorrect = SignUpViewModel().isCodeCorrect(enteredCode);
                if (isCodeCorrect) {
                  Navigator.pushNamed(context, '/signupdetails');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Doğrulama kodu yanlış. Lütfen tekrar deneyin.'),
                    ),
                  );
                }
              },
              child: Text('Doğrula'),
            ),
          ],
        ),
      ),
    );
  }
}
