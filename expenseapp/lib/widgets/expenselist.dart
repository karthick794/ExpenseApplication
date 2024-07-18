import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expenseitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpenseListView extends StatelessWidget {
  const ExpenseListView({super.key,required this.expenseList});
  final List<ExpenseModel> expenseList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount:expenseList.length,itemBuilder: (ctx,index)=>ExpenseItem(expenseitem: expenseList[index]));
  }
}