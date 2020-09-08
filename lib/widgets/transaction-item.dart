import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Models
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction _transaction;
  final Function _deleteTransactionHandler;

  TransactionItem(this._transaction, this._deleteTransactionHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: Text('${_transaction.amount.toStringAsFixed(2)}€'),
              ),
            ),
          ),
          subtitle: Text(
            DateFormat('dd/MM/yyyy').format(_transaction.date),
          ),
          title: Text(_transaction.title),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).errorColor,
            ),
            onPressed: () => _deleteTransactionHandler(_transaction.id),
          ),
        ),
      ),
    );
  }
}