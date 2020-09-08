import 'package:flutter/material.dart';

// Widgets
import './transaction-item.dart';

// Models
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransactionHandler;

  TransactionList(this._transactions, this._deleteTransactionHandler);

  @override
  Widget build(BuildContext context) {
    Widget transactionListContent() {
      if (_transactions.isNotEmpty) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TransactionItem(_transactions[index], _deleteTransactionHandler);
          },
          itemCount: _transactions.length,
        );
      }
      else {
        return Text('No transactions added yet.');
      }
    }

    return transactionListContent();
  }
}