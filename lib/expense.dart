import 'package:expense_tracker/Widget/expenselist.dart';
import 'package:expense_tracker/Widget/newExpense.dart';
import 'package:expense_tracker/data/expenses.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

 

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<Expenses> _registerExpense = [
    Expenses(
        date: DateTime.now(),
        amount: 110,
        title: 'Cinema',
        category: Category.cinema),
    Expenses(
        date: DateTime.now(),
        amount: 120,
        title: 'food',
        category: Category.food),
  ];

  void AddExpenses() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpenses(onAddexpense: _addexpense),
      isScrollControlled: true,
    );
  }

  void _addexpense(Expenses expense) {
    setState(() {
      _registerExpense.add(expense);
      // ignore: unused_local_variable
    });
  }

  void _removeExpense(Expenses expense) {
    setState(() {
      _registerExpense.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        centerTitle: true,
        actions: [IconButton(onPressed: AddExpenses, icon: Icon(Icons.add))],
      ),
      body: Center(
          child: Column(
        children: [
          Container(child: Text('fddfd'),),
          Expanded(child: ExpenseList(expense: _registerExpense,onremove: _removeExpense,)),
        ],
      )),
    );
  }
}
