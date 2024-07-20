
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
        isScrollControlled: false,
        builder: (ctx) =>  AddexpenseItemWidget(addexpesne: addExpenseData,));
  }
void addExpenseData(ExpenseModel expense)
{
  setState(() {
    expenseList.add(expense);
  });
}

void removeexpense(ExpenseModel expense){
  setState(() {
    expenseList.remove(expense);
  });
}

 final List<ExpenseModel> expenseList = [];
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
      body:  Column(
            children: [
              Text(
                "Expense List",
                style: GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ExpenseListView(expenseList: expenseList,removeExpenseList: removeexpense),
              )
            ],
          ),
        );
  }
}
