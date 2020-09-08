import 'package:flutter/material.dart';

// Pages
import './pages/home-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expenses app'),
        ),
        body: HomePage(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
      theme: ThemeData(
        accentColor: Colors.purple,
        fontFamily: 'Roboto',
        primarySwatch: Colors.indigo,
      ),
      title: 'Expenses app',
    );
  }
}