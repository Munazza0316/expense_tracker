import 'package:flutter/material.dart';
import '../database/expense_db.dart';
import '../models/expense_model.dart';

class AddExpenseScreen extends StatelessWidget {
  final amount = TextEditingController();
  final note = TextEditingController();
  String category = "Food";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Expense")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: amount, decoration: InputDecoration(labelText: "Amount")),
            TextField(controller: note, decoration: InputDecoration(labelText: "Note")),
            ElevatedButton(
              child: Text("Save"),
              onPressed: () {
                ExpenseDB.addExpense(
                  Expense(double.parse(amount.text), category, DateTime.now(), note.text),
                );
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}