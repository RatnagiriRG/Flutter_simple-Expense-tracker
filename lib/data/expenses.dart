import 'package:expense_tracker/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category {
  food,
  travel,
  work,
  cinema,
  loan,
  emi,
  credit,
}

const CategoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.work: Icons.work,
  Category.travel: Icons.travel_explore,
  Category.cinema: Icons.movie_creation_sharp,
  Category.loan: Icons.balance,
  Category.emi: Icons.account_balance_wallet,
  Category.credit: Icons.money_off_rounded,
};

class Expenses {
  Expenses({
    required this.date,
    required this.amount,
    required this.title,
    required this.category,
  }) : id = uuid.v4();

  final String title;
  final String id;
  final double amount;
  final DateTime date;
  final Category category;

  get FormattedDate {
    return formatter.format(date);
  }

  double get TotalExpense {
    double sum = 0;
    for (sum = 0; sum <= amount; sum++) {
      sum = sum + amount;
    }
    return sum;
  }
}
