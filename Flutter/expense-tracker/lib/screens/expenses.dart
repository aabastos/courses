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
  List<Expense> expenses = [];

  @override
  initState() {
    super.initState();
    expenses = repository.getExpenses();
  }

  void handleAddExpense(Expense expense) {
    repository.addExpense(expense);

    setState(() {
      expenses = repository.getExpenses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(onAddExpense: handleAddExpense),
      body: Column(
        children: [
          Expanded(child: ExpensesList(expenses: expenses)),
        ],
      ),
    );
  }
}
