import 'package:client/models/todo_model.dart';
import 'package:flutter/material.dart';

class TodoItemWidget extends StatelessWidget {
  TodoItemWidget(
      {Key? key,
      required this.todo,
      required void Function(bool?) onCheckboxChanged,
      required void Function() onDeletePressed})
      : _onCheckboxChanged = onCheckboxChanged,
        _onDeletePressed = onDeletePressed,
        super(key: key);

  final Todo todo;
  void Function(bool?) _onCheckboxChanged;
  void Function() _onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(todo.title),
        subtitle: todo.content != null ? Text(todo.content!) : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: todo.completed ??
                  false, // Utilisez la valeur actuelle de la tâche
              onChanged: _onCheckboxChanged,
            ),
            IconButton(
                onPressed: _onDeletePressed, icon: const Icon(Icons.delete)),
          ],
        ));
  }
}
