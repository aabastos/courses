import 'package:flutter/material.dart';

class NewExpenseDialog extends StatefulWidget {
  const NewExpenseDialog({super.key});

  @override
  State<NewExpenseDialog> createState() => _NewExpenseDialogState();
}

class _NewExpenseDialogState extends State<NewExpenseDialog> {
  TextEditingController titleTextFieldController = TextEditingController();
  TextEditingController amountTextFieldController = TextEditingController();

  @override
  void dispose() {
    titleTextFieldController.dispose();
    amountTextFieldController.dispose();
    super.dispose();
  }

  void handleSaveExpense() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: titleTextFieldController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          TextField(
            controller: amountTextFieldController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Amount'),
              prefixText: '\$',
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: handleSaveExpense,
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
