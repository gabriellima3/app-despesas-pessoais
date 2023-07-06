import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../components/transaction_form.dart';
import '../components/transaction_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Memória RAM SODIM 8GB',
      value: 216.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Teclado Mecânico',
      value: 159.99,
      date: DateTime.now(),
    ),
  ];

  _addTrasaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Output
        TransactionForm(_addTrasaction),
        // Input
        TransactionList(_transactions),
      ],
    );
  }
}
