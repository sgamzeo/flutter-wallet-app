// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_wallet_app/viewmodels/wallet_wiewmodel.dart';

class WalletView extends StatelessWidget {
  final WalletViewModel viewModel = WalletViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Wallet Content Here', // Cüzdan içeriği burada olacak
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                viewModel.loadRecentTransactions();
              },
              child: Text('Load Recent Transactions'), // Son işlemleri yükle
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Yükleme yapıldıktan sonra burada son işlemleri göster
                // Örnek olarak:
                if (viewModel.recentTransactions.isNotEmpty) {
                  for (var transaction in viewModel.recentTransactions) {
                    print('Transaction: ${transaction.type}, Amount: ${transaction.amount}');
                  }
                } else {
                  print('No recent transactions');
                }
              },
              child: Text('Show Recent Transactions'), // Son işlemleri göster
            ),
          ],
        ),
      ),
    );
  }
}
