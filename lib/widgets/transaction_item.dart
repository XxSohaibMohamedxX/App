import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.deletetx,
  });

  final Transaction transaction;
  final Function deletetx;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.pink,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(6),
          child: FittedBox(
            child: Text('\$${transaction.amount}'),
          ),
        ),
      ),
      title: Text(transaction.title),
      subtitle: Text(
        DateFormat.yMMMd().format(transaction.date),
      ),
      trailing: MediaQuery.of(context).size.width > 460
          ? TextButton.icon(
              icon: Icon(Icons.delete),
              label: Text('Delete'),
              onPressed: () => deletetx(transaction.id),
            )
          : IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () => deletetx(transaction.id),
            ),
    );
  }
}
