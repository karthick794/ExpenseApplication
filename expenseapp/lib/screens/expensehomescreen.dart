import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/addexpenseitemwidget.dart';
import 'package:expenseapp/widgets/expenselist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseHomeScreen extends StatefulWidget {
  const ExpenseHomeScreen({super.key});

  @override
  State<ExpenseHomeScreen> createState() => _ExpenseHomeScreenState();
}

class _ExpenseHomeScreenState extends State<ExpenseHomeScreen> {
  void openAddExpenseModelSheet() {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        builder: (ctx) => const AddexpenseItemWidget());
  }

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
      appBar: AppBar(
        title: const Text("Flutter Widget"),
        actions: [
          IconButton(
              onPressed: openAddExpenseModelSheet, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Text(
            "Expense List",
            style: GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ExpenseListView(expenseList: expenseList),
          )
        ],
      ),
    );
  }
}
