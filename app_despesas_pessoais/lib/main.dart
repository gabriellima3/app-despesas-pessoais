import 'package:app_despesas_pessoais/components/transaction_form.dart';
import 'package:app_despesas_pessoais/components/transaction_list.dart';
import 'package:app_despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

import 'components/transaction_user.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Gráfico'),
              ),
            ),
            TransactionUser(),
          ],
        ),
      ),
    );
  }
}
