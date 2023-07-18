import 'package:expense_tracker/domain/expenses/index.dart';

class ExpensesRepository {
  static ExpensesService service = ExpensesService();
  List<Expense> getExpenses() {
    return service.getAll();
  }
}
