
import 'package:flutter/material.dart';
import '../database/expense_db.dart';
import 'add_expense_screen.dart';
import 'analytics_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(
            icon: Icon(Icons.bar_chart),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => AnalyticsScreen()));
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (_) => AddExpenseScreen()));
          setState(() {});
        },
      ),
      body: ListView.builder(
        itemCount: ExpenseDB.expenses.length,
        itemBuilder: (context, index) {
          final e = ExpenseDB.expenses[index];
          return ListTile(
            title: Text("Rs ${e.amount}"),
            subtitle: Text("${e.category} - ${e.note}"),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  ExpenseDB.deleteExpense(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}