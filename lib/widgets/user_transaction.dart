import 'package:flutter/material.dart';

import './transactions_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTansaction extends StatefulWidget {
  @override
  _UserTansactionState createState() => _UserTansactionState();
}

class _UserTansactionState extends State<UserTansaction> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', price: 99.99, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'Gaming Mouse', price: 5.99, date: DateTime.now()),
  ];

  void _addNewTransaction(String newTitle, double newPrice) {
    final newTransaction = Transaction(
      title: newTitle,
      price: newPrice,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
