import 'package:expenses_sheet/models/transaction.dart';
//import 'package:intl/intl.dart';

import './transaction_list_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTrans;
  TransactionList(this.transactions, this.deleteTrans);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'No Transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constraints.maxHeight *
                        .5, //MediaQuery.of(context).size.height * .2,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) =>
                TransactionItem(transactions[index], deleteTrans),
            /*Card(
                elevation: 5,
                margin: EdgeInsets.all(8),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                          child: Text(
                              '${transactions[index].amount.toStringAsFixed(2)}')),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat('EEEE, MMM d ') //| HH:mm')
                        .format(transactions[index].transDate),
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
                      transactions[index].id,
                    ),
                    color: Theme.of(context).errorColor,
                  ),
                ),
              ), //TransactionItem(transactions[index]),
              */
            itemCount: transactions.length,
            /*children: transactions.map((trans) {
          return TransactionItem(trans);
        }).toList(),*/
          );
  }
}
