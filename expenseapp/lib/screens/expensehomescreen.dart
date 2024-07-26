import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/addexpenseitemwidget.dart';
import 'package:expenseapp/widgets/chart.dart';
import 'package:expenseapp/widgets/expenselist.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class ExpenseHomeScreen extends StatefulWidget {
  const ExpenseHomeScreen({super.key});

  @override
  State<ExpenseHomeScreen> createState() => _ExpenseHomeScreenState();
}

class _ExpenseHomeScreenState extends State<ExpenseHomeScreen> {
  void openAddExpenseModelSheet() {
    showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isDismissible: false,
        isScrollControlled: false,
        builder: (ctx) => AddexpenseItemWidget(
              addexpesne: addExpenseData,
            ));
  }

  void addExpenseData(ExpenseModel expense) {
    setState(() {
      expenseList.add(expense);
    });
  }

  void removeexpense(ExpenseModel expense) {
    final expenseIndex = expenseList.indexOf(expense);
    setState(() {
      expenseList.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                expenseList.insert(expenseIndex, expense);
              });
            }),
        duration: const Duration(seconds: 3)));
  }

  final List<ExpenseModel> expenseList = [];
  @override
  Widget build(BuildContext context) {
   final width=MediaQuery.of(context).size.width;
    Widget maincontent = const Center(child: Text("No Expense data "));
    if (expenseList.isNotEmpty) {
      maincontent = ExpenseListView(
          expenseList: expenseList, removeExpenseList: removeexpense);
    }
    return Scaffold(                
      appBar: AppBar(
        title: const Text("Flutter Widget"),
        actions: [
          IconButton(
              onPressed: openAddExpenseModelSheet, icon: const Icon(Icons.add))
        ],
      ),
      body: width< 600 ? Column(
        children: [
             Chart(expenses: expenseList),
          Expanded(
            child: maincontent,
          )
        ],
      ):Row(
          children: [
             Expanded(child: Chart(expenses: expenseList)),
          Expanded(
            child: maincontent,
          )
        ],
      )
    );
  }
}
