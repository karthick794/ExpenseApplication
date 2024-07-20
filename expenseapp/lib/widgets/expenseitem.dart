import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expenseitem});
  final ExpenseModel expenseitem;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expenseitem.expenseName),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\$${expenseitem.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expenseitem.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expenseitem.formattedDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
