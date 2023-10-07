import 'package:expense_tracker/Widget/expense_item.dart';
import 'package:expense_tracker/data/expenses.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expense,
    required this.onremove,
  });
  final List<Expenses> expense;
  final void Function(Expenses expenses) onremove;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expense.length,
        itemBuilder: (context, index) => Dismissible(
            key: ValueKey(expense[index]),
            onDismissed: (direction) {
             onremove(expense[index]);
            },
            child: ExpenseItem(expense: expense[index])));
  }
}
