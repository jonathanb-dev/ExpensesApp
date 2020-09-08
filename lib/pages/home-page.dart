import 'package:flutter/material.dart';

// Widgets
import '../widgets/transaction-manager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: TransactionManager(),
    );
  }
}