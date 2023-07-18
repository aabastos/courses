import 'package:expense_tracker/domain/expenses/index.dart';
import 'package:expense_tracker/widgets/molecules/app_bar/index.dart';
import 'package:expense_tracker/widgets/molecules/expenses_list/index.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final ExpensesRepository repository = ExpensesRepository();
  @override
  Widget build(BuildContext context) {
    final List<Expense> expenses = repository.getExpenses();

    return Scaffold(
      appBar: const AppBarWidget(),
      body: Column(
        children: [
          Expanded(child: ExpensesList(expenses: expenses)),
        ],
      ),
    );
  }
}
