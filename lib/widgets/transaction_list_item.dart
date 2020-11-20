import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction trans;
  final Function deleteTrans;

  const TransactionItem({Key key , @required this.trans,@required this.deleteTrans}) : super(key: key);

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    List<Color> colors = [
      Colors.red,
      Colors.purple,
      Colors.blue,
      Colors.green,
    ];

    _bgColor = colors[Random().nextInt(colors.length)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text('${widget.trans.amount.toStringAsFixed(2)}')),
          ),
        ),
        title: Text(
          widget.trans.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('EEEE, MMM d ') //| HH:mm')
              .format(widget.trans.transDate),
          // DateFormat.MMMMEEEEd().format(trans.transDate),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 450
            ? FlatButton.icon(
                onPressed: () => widget.deleteTrans(
                  widget.trans.id,
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
                onPressed: () => widget.deleteTrans(
                  widget.trans.id,
                ),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
