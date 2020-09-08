import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function _addTransactionHandler;

  TransactionForm(this._addTransactionHandler);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    void _showDatePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year),
        lastDate: DateTime.now(),
      ).then((pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _selectedDate = pickedDate;
        });
      });
    }

    void _submitTransaction() {
      if (_titleController.text.isEmpty || _amountController.text.isEmpty || _selectedDate == null) {
        return;
      }
      double amount = double.tryParse(_amountController.text);
      if (amount == null || amount <= 0) {
        return;
      }
      widget._addTransactionHandler(_titleController.text, double.parse(_amountController.text), _selectedDate);
    }

    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onSubmitted: (_) => _submitTransaction(),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitTransaction(),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(_selectedDate == null ? 'No date chosen' : 'Picked date: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}'),
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    'Choose date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _showDatePicker,
                )
              ],
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Text('Add transaction'),
              onPressed: _submitTransaction,
            ),
          ],
        ),
      ),
    );
  }
}