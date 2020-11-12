import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (builderContext, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView(
            children: transactions
                .map((Transaction transaction) => TransactionItem(
                      key: ValueKey(transaction.id),
                      transaction: transaction,
                      deleteTransaction: deleteTransaction,
                    ))
                .toList(),
          );

    // // This is not working due to a bug in Flutters ListView.builder,
    // // however ListView.builder would be better because it renders only
    // // the items that are on the screen, it's more efficient that way.

    // : ListView.builder(
    //     itemCount: transactions.length,
    //     itemBuilder: (context, index) {
    //       return TransactionItem(
    //           key: ValueKey(transactions[index].id),
    //           transaction: transactions[index],
    //           deleteTransaction: deleteTransaction);
    //     },
    //   );
  }
}
