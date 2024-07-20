import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expenseitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpenseListView extends StatelessWidget {
  const ExpenseListView({super.key,required this.expenseList,required this.removeExpenseList});
  final List<ExpenseModel> expenseList;
  final void Function(ExpenseModel expense) removeExpenseList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount:expenseList.length,
    itemBuilder: (ctx,index)=>Dismissible(key: ValueKey(expenseList[index]), onDismissed: (direction) {
      removeExpenseList(expenseList[index]);
    },child: ExpenseItem(expenseitem: expenseList[index]))
    );
  }
}