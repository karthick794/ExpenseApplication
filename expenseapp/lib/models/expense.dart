import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category{food,travel,lesiure,work}

class ExpenseModel {
  final String id;
  final String expenseName;
  final double amount;
  final DateTime dateTime;
  final Category category;

  ExpenseModel(
      {required this.expenseName, required this.amount, required this.dateTime,required this.category})
      : id = uuid.v4();
}
