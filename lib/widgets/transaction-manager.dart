import 'package:flutter/material.dart';

// Widgets
import './chart.dart';
import './transaction-list.dart';
import './transaction-form.dart';

// Models
import '../models/transaction.dart';

class TransactionManager extends StatefulWidget {
  @override
  _TransactionManagerState createState() => _TransactionManagerState();
}

class _TransactionManagerState extends State<TransactionManager> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 1,
      title: 'Test 1',
      amount: 29.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      title: 'Test 2',
      amount: 50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 3,
      title: 'Test 3',
      amount: 75.5,
      date: DateTime.now(),
    )
  ];
  var _showShart = false;

  Widget transactionManagerContent() {
    if (_showShart) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Chart(_recentTransactions),
      );
    }
    else {
      return Container(
        height: MediaQuery.of(context).size.height * 1,
        child: TransactionList(_transactions, _deleteTransaction),
      );
    }
  }
  
  void _addTransaction(String title, double amount, DateTime dateTime) {
    Transaction transaction = Transaction(
      id: 1,
      title: title,
      amount: amount,
      date: dateTime,
    );

    setState(() {
      _transactions.add(transaction);
    });
  }

  void _deleteTransaction(int id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((transaction) {
      return transaction.date.isAfter(DateTime.now().subtract(Duration(
        days: 7,
      )));
    }).toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Show chart'),
                Switch(
                  value: _showShart,
                  onChanged: (value) {
                    setState(() {
                      _showShart = value;
                    });
                  },
                ),
              ],
            ),
            transactionManagerContent(),
            TransactionForm(_addTransaction),
          ],
        ),
      ),
    );
  }
}