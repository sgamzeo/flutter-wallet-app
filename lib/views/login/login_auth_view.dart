import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/viewmodels/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                Provider.of<LoginViewModel>(context, listen: false).email = value;
              },
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                Provider.of<LoginViewModel>(context, listen: false).password = value;
              },
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<LoginViewModel>(context, listen: false).login(context);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}