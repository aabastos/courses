import 'package:expense_tracker/domain/expenses/index.dart';
import 'package:expense_tracker/utils/index.dart';
import 'package:flutter/material.dart';

class NewExpenseDialog extends StatefulWidget {
  const NewExpenseDialog({super.key});

  @override
  State<NewExpenseDialog> createState() => _NewExpenseDialogState();
}

class _NewExpenseDialogState extends State<NewExpenseDialog> {
  TextEditingController titleTextFieldController = TextEditingController();
  TextEditingController amountTextFieldController = TextEditingController();

  final List<DropdownMenuItem> categoryOptions = Category.values
      .map(
        (category) => DropdownMenuItem(
          value: category,
          child: Text(category.name.toString().toUpperCase()),
        ),
      )
      .toList();

  DateTime? selectedDate;
  Category selectedCategory = Category.leisure;

  @override
  void dispose() {
    titleTextFieldController.dispose();
    amountTextFieldController.dispose();
    super.dispose();
  }

  void handleOpenDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  void handleCategorySelected(dynamic value) {
    if (value == null) return;
    setState(() {
      selectedCategory = value;
    });
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: amountTextFieldController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$',
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      selectedDate == null
                          ? 'No date selected'
                          : DateFormatter.formatDate(selectedDate!),
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: handleOpenDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton(
                value: selectedCategory,
                items: categoryOptions,
                onChanged: handleCategorySelected,
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
        ],
      ),
    );
  }
}
