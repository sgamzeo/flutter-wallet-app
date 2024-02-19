// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/components/button.dart';
import 'package:flutter_wallet_app/components/pin_fields.dart';
import 'package:flutter_wallet_app/service/routes.dart';
import 'package:flutter_wallet_app/viewmodels/signup_viewmodel.dart';


class VerificationCodeView extends StatefulWidget {
  final String email;

  const VerificationCodeView({Key? key, required this.email}) : super(key: key);

  @override
  _VerificationCodeViewState createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
  late String enteredCode; // enteredCode değişkenini 'late' olarak işaretleyin

  @override
  void initState() {
    super.initState();
    enteredCode = ''; // enteredCode'u başlangıçta boş bir string olarak ayarlayın
  }

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
            VerificationCodeInput( // PinField widget'ını kullanın
              length: 6, // Doğrulama kodunun uzunluğunu belirtin
              onChanged: (value) {
                setState(() {
                  enteredCode = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Button( 
              text: 'Doğrula',
              onPressed: () {
               Navigator.pushNamed(
                    context,
                    AppRoutes.signupdetails);
              },
            ),
          ],
        ),
      ),
    );
  }
}
