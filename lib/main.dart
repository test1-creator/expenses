import 'package:expense/pages/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Expense());
}

class Expense extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.purple,
        fontFamily: 'OpenSans',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'OpenSans')
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
