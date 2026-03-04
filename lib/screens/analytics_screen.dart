import 'package:flutter/material.dart';
import '../database/expense_db.dart';

class AnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var e in ExpenseDB.expenses) {
      total += e.amount;
    }

    return Scaffold(
      appBar: AppBar(title: Text("Analytics")),
      body: Center(
        child: Text("Total Expense: Rs $total", style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
