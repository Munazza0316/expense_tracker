import '../models/expense_model.dart';

class ExpenseDB {
  static List<Expense> expenses = [];

  static addExpense(Expense e) {
    expenses.add(e);
  }

  static deleteExpense(int index) {
    expenses.removeAt(index);
  }
}