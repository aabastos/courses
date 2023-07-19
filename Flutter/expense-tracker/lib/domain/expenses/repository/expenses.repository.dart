import 'package:expense_tracker/domain/expenses/index.dart';

class ExpensesRepository {
  static ExpensesService service = ExpensesService();
  List<Expense> getExpenses() {
    return service.getAll();
  }

  void addExpense(Expense expense) {
    service.createExpense(expense);
  }

  void removeExpense(Expense expense) {
    service.deleteExpense(expense);
  }
}
