import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction _trans;

  TransactionItem(this._trans);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.purple,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              'EGP ${_trans.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _trans.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('EEEE, MMM dd | HH:mm').format(_trans.transDate),
                // DateFormat.MMMMEEEEd().format(_trans.transDate),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
