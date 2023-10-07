import 'package:expense_tracker/data/expenses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewExpenses extends StatefulWidget {
  NewExpenses({
    super.key,
    required this.onAddexpense,
  });
  void Function(Expenses expenses) onAddexpense;

  @override
  State<NewExpenses> createState() => _NewExpensesState();
}

class _NewExpensesState extends State<NewExpenses> {
  DateTime? _selectDate;
  Category? _selecetcategory;

  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();

  void PresentDate() async {
    final now = DateTime.now();
    final FirstDate = DateTime(now.year - 1);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: FirstDate,
        lastDate: now);

    setState(() {
      _selectDate = pickedDate;
    });
  }

  void submitExpense() {
    final enteredamount = double.tryParse(_amountcontroller.text);
    final amountisInvalid = enteredamount == null || enteredamount <= 0;
    if (_titlecontroller.text.trim().isEmpty ||
        amountisInvalid ||
        _selectDate == null ||
        _selecetcategory == null) {
      showCupertinoDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Invalid"),
                content: Text(_titlecontroller.text.trim().isEmpty
                    ? 'title invalid'
                    : amountisInvalid
                        ? 'invalid amount'
                        : _selecetcategory == null
                            ? 'no category selected'
                            : _selectDate == null
                                ? 'select any date'
                                : "make sure everything is correct"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("ok"))
                ],
              ));
    }
    widget.onAddexpense(Expenses(
        date: _selectDate!,
        amount: enteredamount!,
        title: _titlecontroller.text,
        category: _selecetcategory!));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _amountcontroller.dispose();
    _titlecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(label: Text('Title')),
            controller: _titlecontroller,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: _amountcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(label: Text('amount')),
              )),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton.icon(
                        onPressed: PresentDate,
                        icon: Icon(Icons.calendar_month),
                        label: Text(_selectDate == null
                            ? "select any date"
                            : formatter.format(_selectDate!)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton(
                value: _selecetcategory,
                items: Category.values
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase()),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    if (value == null) {
                      return;
                    }
                    _selecetcategory = value;
                  });
                },
              ),
              const SizedBox(
                width: 40,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("cancel")),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: submitExpense,
                child: Text("save"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(125, 210, 7, 255)),
              )
            ],
          )
        ],
      ),
    );
  }
}
