import 'package:flutter/services.dart';

import './widgets/new_transaction.dart';

//import './widgets/user_transactions.dart';

import './widgets/transaction_list.dart';
import './models/transaction.dart';
import 'package:flutter/material.dart';
import './widgets/chart.dart';

void main() {
  /*WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);*/

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Sheet',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: ThemeData.light().textTheme.headline6.copyWith(
                    fontFamily: 'QuickSand',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
              button: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                //fontFamily: 'QuickSand',
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                ),
                bodyText1: TextStyle(
                  fontFamily: 'QuickSand',
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 119.959,
    //   transDate: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'New Jacket',
    //   amount: 249.99,
    //   transDate: DateTime.now(),
    // ),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((element) {
      return element.transDate.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final transaction = Transaction(
      amount: amount,
      title: title,
      id: DateTime.now().toString(),
      transDate: date,
    );

    setState(() {
      _userTransactions.add(transaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    var appBar = AppBar(
      title: Text(
        'Expenses Sheet',
        style: TextStyle(
          fontFamily: 'OpenSans',
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ],
    );
    final appBarHeight = appBar.preferredSize.height;

    var transChart = Container(
      child: Chart(_recentTransactions),
      height: (MediaQuery.of(context).size.height -
              appBarHeight -
              MediaQuery.of(context).padding.top) *
          (isLandscape ? 0.6 : 0.25),
    );
    var transList = Container(
      child: TransactionList(_userTransactions, _deleteTransaction),
      height: (MediaQuery.of(context).size.height -
              appBarHeight -
              MediaQuery.of(context).padding.top) *
          0.75,
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /*Container(
                          width: double.infinity,
                          
                          child: Card(
                            color: Colors.blue,
                            child: Chart(_recentTransactions),
                            elevation: 5,
                          ),
                        ),*/
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Show Chart',
                  ),
                  Switch(
                      value: _showChart,
                      onChanged: (val) {
                        setState(() {
                          _showChart = val;
                        });
                      })
                ],
              ),
            if (!isLandscape) transChart,
            if (!isLandscape) transList,
            if (isLandscape)
              _showChart
                  ? transChart
                  :
                  /*Card(
                      child: Text('LIST OF TX'),
                    ),*/
                  // NewTransaction(),
                  transList,
            //UserTransactions()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
