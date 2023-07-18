import 'package:expense_tracker/widgets/organisms/new_expense_dialog.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  void handleAddExpensePress() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpenseDialog(),
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
