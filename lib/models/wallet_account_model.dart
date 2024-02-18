import 'package:cloud_firestore/cloud_firestore.dart';

class WalletAccount {
  final String userID;
  double balance;
  DateTime lastTransactionDate;

  WalletAccount({
    required this.userID,
    this.balance = 0.0,
    required this.lastTransactionDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'balance': balance,
      'lastTransactionDate': lastTransactionDate,
    };
  }

  WalletAccount.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        balance = map['balance'],
        lastTransactionDate = (map['lastTransactionDate'] as Timestamp).toDate();
}
