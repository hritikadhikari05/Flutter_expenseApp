import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text(
                    'No transaction found!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Container(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text(
                            '\$${transactions[index].price}',
                          )),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date)),
                    ),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}

// Card(
//   elevation: 10,
//   child: Row(children: [
//     Container(
//       child: Text(
//         '\$${tx.price.toStringAsFixed(2)}',
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 12,
//           color: Theme.of(context).primaryColor,
//         ),
//       ),
//       margin: EdgeInsets.symmetric(
//           vertical: 10, horizontal: 15),
//       decoration: BoxDecoration(
//           border: Border.all(
//         color: Theme.of(context).primaryColor,
//         width: 2,
//       )),
//       padding: EdgeInsets.all(10),
//     ),
//     Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           tx.title,
//           style: Theme.of(context).textTheme.title,
//         ),
//         Text(
//           DateFormat().format(tx.date),
//           style: TextStyle(
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     )
//   ]),
// );
