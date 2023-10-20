import 'package:client/models/todo.dart';
import 'package:client/services/todo.service.dart';
import 'package:client/widgets/todoItem.widget.dart';
import 'package:flutter/material.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  final todoService = TodoService();
  List<Todo>? todos; // Utilisez "List<Todo>?" pour indiquer que la liste peut être nulle.

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final loadedTodos = await todoService.getTodos();
    setState(() {
      todos = loadedTodos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: todos != null
          ? ListView.builder(
              itemCount: todos!.length,
              itemBuilder: (_, int index) {
                return TodoItemWidget(todos![index]);
              },
            )
          : const Center(
              child: CircularProgressIndicator(), // Ou un widget de chargement personnalisé.
            ),
    );
  }
}
