import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expenselist.dart';
import 'package:flutter/material.dart';

class ExpenseHomeScreen extends StatefulWidget {
  const ExpenseHomeScreen({super.key});

  @override
  State<ExpenseHomeScreen> createState() => _ExpenseHomeScreenState();
}

class _ExpenseHomeScreenState extends State<ExpenseHomeScreen> {
  final List<ExpenseModel> expenseList = [
    ExpenseModel(
        expenseName: "Travel",
        amount: 20.0,
        dateTime: DateTime.now(),
        category: Category.travel),
    ExpenseModel(
        expenseName: "Food",
        amount: 10.0,
        dateTime: DateTime.now(),
        category: Category.food),
    ExpenseModel(
        expenseName: "Work",
        amount: 30.0,
        dateTime: DateTime.now(),
        category: Category.work),
    ExpenseModel(
        expenseName: "Lesiure",
        amount: 5.0,
        dateTime: DateTime.now(),
        category: Category.lesiure),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("chart"),
          Expanded(child: ExpenseListView(expenseList: expenseList))
        ],
      ),
    );
  }
}
