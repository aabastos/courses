import 'package:expense_tracker/domain/expenses/index.dart';
import 'package:expense_tracker/widgets/molecules/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final Function(Expense expense) onRemoveExpense;

  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) => onRemoveExpense(expenses[index]),
        child: ExpenseItem(expense: expenses[index]),
      ),
    );
  }
}
