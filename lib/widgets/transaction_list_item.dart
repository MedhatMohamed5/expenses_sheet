import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction _trans;
  final Function deleteTrans;

  const TransactionItem(this._trans, this.deleteTrans);

  @override
  Widget build(BuildContext context) {
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
        trailing: MediaQuery.of(context).size.width > 450
            ? FlatButton.icon(
                onPressed: () => deleteTrans(
                  _trans.id,
                ),
                icon: const Icon(
                  Icons.delete,
                ),
                label: const Text(
                  'Delete',
                ),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: const Icon(
                  Icons.delete,
                ),
                onPressed: () => deleteTrans(
                  _trans.id,
                ),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
