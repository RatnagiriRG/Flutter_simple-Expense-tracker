import 'package:expense_tracker/expense.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    themeAnimationDuration: Duration(seconds: 1),
    darkTheme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: Expense(),
  ));
}