import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit, {super.key});

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  onPressed: () {
                    final title = titleController.text;
                    final value = double.tryParse(valueController.text) ?? 0;
                    onSubmit(title, value);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
