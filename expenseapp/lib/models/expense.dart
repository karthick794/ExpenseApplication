import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter=DateFormat.yMd();
enum Category{food,travel,lesiure,work}

const categoryIcons={
Category.food:Icons.lunch_dining,
Category.travel:Icons.flight_takeoff,
Category.work:Icons.work,
Category.lesiure:Icons.movie,
};

class ExpenseModel {
  final String id;
  final String expenseName;
  final double amount;
  final DateTime dateTime;
  final Category category;
String get formattedDate
{ 
  return formatter.format(dateTime);
}
  ExpenseModel(
      {required this.expenseName, required this.amount, required this.dateTime,required this.category})
      : id = uuid.v4();
}

