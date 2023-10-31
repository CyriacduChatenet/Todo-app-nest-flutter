import 'package:client/blocs/todo/todo_bloc.dart';
import 'package:client/blocs/todo/todo_state.dart';
import 'package:client/repository/todo_repository.dart';
import 'package:client/services/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoList extends StatefulWidget {
  TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TodoService _todoService = TodoService(TodoRepository(), TodoBloc());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _todoService.findAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is LoadedTodoState) {
          final todos = state.todos;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.title as String),
                trailing: Checkbox(
                  value: todo.completed,
                  onChanged: (value) {
                    // Émettre un événement pour mettre à jour l'état du todo
                    // Vous devez implémenter cette logique
                  },
                ),
              );
            },
          );
        } else if (state is ErrorTodoState) {
          return Center(
            child: Text(
                'Erreur lors de la récupération des Todos: ${state.errorMessage}'),
          );
        } else {
          // Éventuellement, vous pouvez afficher un indicateur de chargement ici
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
