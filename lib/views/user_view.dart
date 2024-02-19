import 'package:flutter/material.dart';

import 'package:flutter_wallet_app/viewmodels/user_viewmodel.dart';

class UserView extends StatelessWidget {
  final UserViewModel viewModel;

  UserView({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'User Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildUserInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Column(
      children: [
        // Buraya kullanıcı bilgilerini göstermek için gerekli widget'lar eklenir
        // Örnek olarak:
        // Text('Name: ${viewModel.currentUser?.name}'),
        // Text('Email: ${viewModel.currentUser?.email}'),
        // vb.
      ],
    );
  }
}
