import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenseapp/models/expense.dart';

final formatter = DateFormat.yMd();

class AddexpenseItemWidget extends StatefulWidget {
  const AddexpenseItemWidget({super.key});

  @override
  State<AddexpenseItemWidget> createState() => _AddexpenseItemWidgetState();
}

class _AddexpenseItemWidgetState extends State<AddexpenseItemWidget> {
  // var _userInput = "";
  // void saveUserInput(String input) {
  //   _userInput = input;
  // }
  var titleEditcontroller = TextEditingController();
  var amountEditController = TextEditingController();
  DateTime? selectedDate;
  Category selectedCategory=Category.lesiure;

  @override
  void dispose() {
    titleEditcontroller.dispose();
    amountEditController.dispose();
    super.dispose();
  }

  void presentDatePicker() async {
    final firstDate = DateTime.now();
    final lastDate = firstDate;
    final currentDate =
        DateTime(firstDate.year - 1, firstDate.month, firstDate.day);
    final date = await showDatePicker(
        context: context,
        initialDate: firstDate,
        firstDate: currentDate,
        lastDate: lastDate);
    setState(() {
      selectedDate = date;
    });
  }

  void clearEdtiorvalue() {
    titleEditcontroller.clear();
    amountEditController.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            // onChanged: saveUserInput,
            controller: titleEditcontroller,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  // onChanged: saveUserInput,
                  controller: amountEditController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixText: "\$", label: Text("Amount")),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(selectedDate == null
                      ? "No date selected"
                      : formatter.format(selectedDate!)),
                  IconButton(
                      onPressed: presentDatePicker,
                      icon: const Icon(Icons.calendar_month))
                ],
              )),
            ],
          ),
          const SizedBox(height: 40,),
          Row(
            children: [
              DropdownButton(
                value: selectedCategory,
                  items: Category.values
                      .map(
                        (category) =>
                          DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toString()
                            )
                            )
                            )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                        return;
                      }
                    setState(() {
                      selectedCategory = value;
                    });
                  }),
             const Spacer(),
              TextButton(
                  onPressed: clearEdtiorvalue, child: const Text("Cancel")),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    // print(_userInput);
                    print(titleEditcontroller.text +
                        amountEditController.text +
                        " " +
                        formatter.format(selectedDate!).toString());
                  },
                  child: const Text("Add Expense"))
            ],
          )
        ],
      ),
    );
  }
}