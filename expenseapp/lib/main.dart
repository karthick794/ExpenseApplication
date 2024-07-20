// ignore_for_file: deprecated_member_use

import 'package:expenseapp/screens/expensehomescreen.dart';
import 'package:flutter/material.dart';

var kColors =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColors,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColors.primary,
            foregroundColor: kColors.onPrimary),
        cardTheme: const CardTheme().copyWith(
            color: kColors.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8))),
    home: const ExpenseHomeScreen(),
  ));
}
