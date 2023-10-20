import 'package:client/models/todo.dart';
import 'package:flutter/material.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget(this.todo, {Key? key}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            todo.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            todo.content,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // Gérer l'édition de la tâche ici.
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  // Gérer la suppression de la tâche ici.
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
