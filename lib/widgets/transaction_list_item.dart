import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction _trans;
  final Function deleteTrans;

  TransactionItem(this._trans, this.deleteTrans);

  @override
  Widget build(BuildContext context) {
    /*return Card(
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
                color: Theme.of(context).primaryColorLight,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              'EGP ${_trans.amount.toStringAsFixed(2)}',
              /*style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).primaryColorDark,
              ),*/
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Theme.of(context).primaryColorDark,
                  ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _trans.title,
                /*style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),*/
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                DateFormat('EEEE, MMM d').format(_trans.transDate),
                // DateFormat.MMMMEEEEd().format(_trans.transDate),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );*/
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child:
                FittedBox(child: Text('${_trans.amount.toStringAsFixed(2)}')),
          ),
        ),
        title: Text(
          _trans.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('EEEE, MMM d ') //| HH:mm')
              .format(_trans.transDate),
          // DateFormat.MMMMEEEEd().format(_trans.transDate),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
          ),
          onPressed: () => deleteTrans(
            _trans.id,
          ),
          color: Theme.of(context).errorColor,
        ),
      ),
      /*children: transactions.map((trans) {
          return TransactionItem(trans);
        }).toList(),*/
    );
  }
}
