import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/service/firebase_auth.dart'; // FirebaseAuthService'ı import et

class VerificationDetailsView extends StatelessWidget {
  final String email;
  final String verificationCode;

  const VerificationDetailsView(
      {Key? key, required this.email, required this.verificationCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuthService _firebaseAuthService =
        FirebaseAuthService(); // FirebaseAuthService instance oluştur

    String name = ''; // Ad alanı
    String surname = ''; // Soyad alanı
    String phoneNumber = ''; // Telefon Numarası alanı
    String identityNo = ''; // TC Kimlik Numarası alanı

    double initialBalance = 0.0; // Varsayılan başlangıç bakiyesi

    return Scaffold(
      appBar: AppBar(
        title: Text('Kişisel Bilgileri Doğrula'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'E-posta: $email',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Doğrulama Kodu: $verificationCode',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) =>
                  name = value, // Ad alanına girilen değeri al
              decoration: InputDecoration(
                labelText: 'Ad',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) =>
                  surname = value, // Soyad alanına girilen değeri al
              decoration: InputDecoration(
                labelText: 'Soyad',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) => phoneNumber =
                  value, // Telefon Numarası alanına girilen değeri al
              decoration: InputDecoration(
                labelText: 'Telefon Numarası',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) => identityNo =
                  value, // TC Kimlik Numarası alanına girilen değeri al
              decoration: InputDecoration(
                labelText: 'TC Kimlik Numarası',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _firebaseAuthService.signUpUser(
                  name: name,
                  surname: surname,
                  identityNo: identityNo,
                  phoneNumber: phoneNumber,
                  initialBalance: initialBalance,
                );
                Navigator.pushNamed(context, '/wallet');
              },
              child: Text('Kaydol'),
            ),
          ],
        ),
      ),
    );
  }
}
