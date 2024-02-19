import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WalletViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late List<Transaction> _recentTransactions = [];

  List<Transaction> get recentTransactions => _recentTransactions;

  Future<void> loadRecentTransactions() async {
    try {
      // Firestore'dan son üç işlemi yükle
      QuerySnapshot querySnapshot = await _firestore
          .collection('transactions')
          .orderBy('timestamp', descending: true)
          .limit(3)
          .get();

      // Son üç işlemi listeye dönüştür
      List<Transaction> transactions = querySnapshot.docs
          .map((doc) => Transaction.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      // Alınan işlemleri güncelle
      _recentTransactions = transactions;
      notifyListeners();
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }

  // Geri kalan sınıfı buraya ekleyebilirsiniz
}

class Transaction {
  final String id;
  final String userId;
  final String type;
  final double amount;
  final DateTime timestamp;

  Transaction({
    required this.id,
    required this.userId,
    required this.type,
    required this.amount,
    required this.timestamp,
  });

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      userId: map['userId'],
      type: map['type'],
      amount: map['amount'],
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }
}
