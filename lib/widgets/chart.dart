import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Extensions
import '../extensions/extended-datetime.dart';

// Widgets
import './chart-bar.dart';

// Models
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransactions;

  Chart(this._recentTransactions);

  List<Map<String, Object>> get _groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(
        days: index,
      ));
      var totalAmount = 0.0;
      for (var i = 0; i < _recentTransactions.length; i++) {
        if (_recentTransactions[i].date.isDateEqualTo(weekDay)) {
          totalAmount += _recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalAmount
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return _groupedTransactionsValues.fold(0.0, (previousValue, element) {
      return previousValue + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _groupedTransactionsValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(data['day'], data['amount'], totalSpending == 0.0 ? 0.0 : (data['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}