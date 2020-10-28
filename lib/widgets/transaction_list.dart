import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((Transaction transaction) {
        return Card(
          child: Row(
            children: [
              /////////// TX AMOUNT
              Container(
                child: Text(
                  '\$${transaction.amount}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.all(10),
              ),
              /////////// TX DETAILS
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /////////// TX TITLE
                  Text(
                    transaction.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  /////////// TX DATE
                  Text(
                    DateFormat.yMMMMEEEEd().format(transaction.date),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              )
            ],
          ),
          elevation: 5,
        );
      }).toList(),
    );
  }
}
