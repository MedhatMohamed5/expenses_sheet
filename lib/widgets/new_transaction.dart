import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _date;

  void _submitData() {
    final title = _titleController.text.trim();
    final amount = double.parse(_amountController.text.trim());
    if (title.isEmpty || amount <= 0 || _date == null) return;
    widget.addTransaction(title, amount, _date);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null)
        setState(() {
          _date = value;
        });
      else
        return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onSubmitted: (_) => _submitData(),
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              //onChanged: (value) => amountInput = value,
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _date == null
                        ? 'No Date Chosen!'
                        : DateFormat('EEEE, MMM d').format(_date),
                  ),
                  /*FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text('Choose Date'),
                    onPressed: () {},
                  ),*/
                  IconButton(
                    icon: Icon(
                      Icons.calendar_today,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              onPressed: _submitData,
              /*() {
                widget.addTransaction(
                  _titleController.text,
                  double.parse(_amountController.text),
                );
              },*/
              child: Text('Add Transaction'),
              textColor: Theme.of(context).textTheme.button.color,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
