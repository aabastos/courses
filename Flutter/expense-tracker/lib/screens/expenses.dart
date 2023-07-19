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
    refreshExpensesList();
  }

  void refreshExpensesList() {
    setState(() {
      expenses = repository.getExpenses();
    });
  }

  void handleAddExpense(Expense expense) {
    repository.addExpense(expense);
    refreshExpensesList();
  }

  void handleUndoRemoveExpense(Expense expense) {
    repository.addExpense(expense);
    refreshExpensesList();
  }

  void handleRemoveExpense(Expense expense) {
    repository.removeExpense(expense);
    refreshExpensesList();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense removed!'),
      action: SnackBarAction(
        onPressed: () => handleUndoRemoveExpense(expense),
        label: 'Undo',
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(onAddExpense: handleAddExpense),
      body: Column(
        children: [
          Expanded(
            child: ExpensesList(
              expenses: expenses,
              onRemoveExpense: handleRemoveExpense,
            ),
          ),
        ],
      ),
    );
  }
}
