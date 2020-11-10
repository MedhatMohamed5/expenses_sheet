import 'package:expenses_sheet/models/transaction.dart';

import './transaction_list_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .6,
      child: SingleChildScrollView(
        child: Column(
          children: transactions.map((trans) {
            return TransactionItem(trans);
          }).toList(),
        ),
      ),
    );
  }
}
