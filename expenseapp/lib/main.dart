import 'package:expenseapp/screens/expensehomescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    home: const ExpenseHomeScreen(),
  ));
}
