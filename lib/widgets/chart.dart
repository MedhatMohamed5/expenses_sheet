import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var transaction in recentTransactions) {
        if (transaction.transDate.day == weekDay.day &&
            transaction.transDate.month == weekDay.month &&
            transaction.transDate.year == weekDay.year) {
          totalSum += transaction.amount;
        }
      }

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionsValues.fold(
      0.0,
      (sum, element) => (sum + element['amount']),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionsValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionsValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data['day'],
                amount: data['amount'],
                percentage: totalSpending > 0
                    ? (data['amount'] as double) / totalSpending
                    : 0,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
