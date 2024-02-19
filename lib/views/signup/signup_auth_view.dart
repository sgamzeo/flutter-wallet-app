import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/components/button.dart';
import 'package:flutter_wallet_app/components/text_field.dart';
import 'package:flutter_wallet_app/viewmodels/signup_viewmodel.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key, required String title, required String description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpViewModel = SignUpViewModel();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kayıt Ol'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            VerificationCodeTextInput(
              onChanged: (value) {
                signUpViewModel.email = value;
              }, length: 99,
          
            ),
            const SizedBox(height: 16.0),
            signUpViewModel.isEmailValid(signUpViewModel.email)
                ? Button(
                    text: 'Kayıt Ol',
                    onPressed: () {
                      // E-posta adresinin geçerli olduğunu kontrol et ve doğrulama kodu ekranına git
                      signUpViewModel.goToVerificationCode(context);
                    },
                  )
                : const SizedBox(), 
          ],
        ),
      ),
    );
  }
}
