import 'package:expense_tracker/domain/expenses/enums/index.dart';
import 'package:expense_tracker/domain/expenses/models/index.dart';

class ExpensesService {
  static List<Expense> expenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  List<Expense> getAll() {
    return expenses;
  }

  void createExpense(Expense expense) {
    expenses.add(expense);
  }
}
