import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      child: transactions.isEmpty
          ? Column(
              children: [
                Container(
                  height: 200,
                  alignment: Alignment.center,
                  child: const Image(
                    image: AssetImage('./assets/images/middle.png'),
                    alignment: Alignment.bottomRight,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Nenhuma transação cadastrada',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromRGBO(61, 143, 172, 1),
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                            'R\$${tr.value}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: const Color.fromARGB(255, 184, 25, 14),
                      onPressed: () => onRemove(tr.id),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
