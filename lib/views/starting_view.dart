import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/components/button.dart';

class StartingView extends StatelessWidget {
  const StartingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hoş Geldiniz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Button(
              text: 'Giriş Yap',
              
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            SizedBox(height: 20),
            Button(
              text: 'Kayıt Ol',
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
