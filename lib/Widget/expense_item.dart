import 'package:flutter/material.dart';

import '../data/expenses.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    super.key,
    required this.expense,
  });
  final Expenses expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Rs.${expense.amount.toString()}'),
                Icon(CategoryIcons[expense.category]),
                Text(expense.FormattedDate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
