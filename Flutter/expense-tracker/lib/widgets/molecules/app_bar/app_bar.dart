import 'package:expense_tracker/domain/expenses/index.dart';
import 'package:expense_tracker/widgets/organisms/new_expense_dialog.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final void Function(Expense expense) onAddExpense;
  const AppBarWidget({super.key, required this.onAddExpense});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  void handleAddExpensePress() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpenseDialog(onAddExpense: widget.onAddExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Expense Tracker'),
      actions: [
        IconButton(
          onPressed: handleAddExpensePress,
          icon: const Icon(Icons.add),
        )
      ],
    );
  }
}
