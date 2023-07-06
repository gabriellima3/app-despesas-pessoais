import 'package:app_despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(ExpensesApp());

// ignore: use_key_in_widget_constructors
class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final _transactions = [
    Transaction(
      tr: '1',
      title: 'Memória RAM SODIM 8GB',
      value: 216.5,
      date: DateTime.now(),
    ),
    Transaction(
      tr: '2',
      title: 'Teclado Mecânico',
      value: 159.99,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Gráfico'),
              ),
            ),
            Column(
              children: _transactions.map((tr) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 54, 136, 244),
                              width: 2),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${tr.value.toString()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 54, 136, 244),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr.title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat('dd/MM/yyyy H:mm aaa').format(tr.date),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Título',
                      ),
                    ),
                    TextField(
                      controller: valueController,
                      decoration: const InputDecoration(
                        labelText: 'Valor (R\$)',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text(
                            'Nova Transação',
                            style: TextStyle(
                              color: Color.fromARGB(255, 54, 136, 244),
                            ),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
