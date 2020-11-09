import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  UserTransactions({Key key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 119.959,
      transDate: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Jacket',
      amount: 249.99,
      transDate: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final transaction = Transaction(
      amount: amount,
      title: title,
      id: DateTime.now().toString(),
      transDate: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
