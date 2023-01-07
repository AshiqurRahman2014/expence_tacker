import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../model/expence_model.dart';
import '../provider/expence_provider.dart';

List<String> catagory = [
  'Food Cost',
  'Travels Cost',
  'Medical Cost',
  'Education Cost',
  'Mobile Bill Cost'
];

String getFormattedDate(DateTime dateTime, String pattern) {
  return DateFormat(pattern).format(dateTime);
}

void showMsg(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

Row ShowListTile(ExpenseModel expence, BuildContext context) {
  return Row(
    children: [
      SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width * .83,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(
            expence.catagory,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          subtitle: Text(expence.datetime),
          trailing: Text(
            "\$ ${expence.cost.toString()}",
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          tileColor: Colors.green,
        ),
      ),
      Column(
        children: [
          IconButton(onPressed: () {
            Provider.of<ExpenceProvider>(context, listen: false)
                .deleteExpence(expence);
          }, icon: const Icon(Icons.delete,color: Colors.red,)),
        ],
      )
    ],
  );
}
