import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction t;
  final Function(String) onRemove;

  const TransactionItem({super.key,
    required this.t,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('R\$${t.value.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          '${t.title}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(DateFormat('d MMM y').format(t.date)),
        trailing: mediaQuery.size.width > 480
            ? TextButton(
                onPressed: () => onRemove(t.id),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                  padding: EdgeInsets.all(16.0),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 8.0), // Espaço entre o ícone e o texto
                    Text("Excluir"),
                  ],
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
                onPressed: () => onRemove(t.id),
              ),
      ),
    );
  }
}
