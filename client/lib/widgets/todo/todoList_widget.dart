import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:client/blocs/todos/todos_bloc.dart';
import 'package:client/blocs/todos/todos_event.dart';
import 'package:client/blocs/todos/todos_state.dart';
import 'package:client/repository/todo_repository.dart';
import 'package:client/widgets/todo/todoItem_widget.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(builder: (context, state) {
      Future<String> getToken() async {
        final token = await const FlutterSecureStorage().read(key: 'token');
        if (token != null) {
          return token;
        } else {
          return '';
        }
      }

      if (state is TodosLoaded) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.todos.length,
          itemBuilder: (context, index) {
            final todo = state.todos[index];
            return TodoItemWidget(
              todo: todo,
              onCheckboxChanged: (bool? value) async {
                context.read<TodosBloc>().add(UpdateTodo(
                      todo: todo.copyWith(completed: value),
                    ));
                TodoRepository().updateTodo(
                    todo: todo.copyWith(completed: value),
                    accessToken: await getToken());
              },
              onDeletePressed: () async {
                TodoRepository()
                    .deleteTodo(id: todo.id!, accessToken: await getToken());
                context.read<TodosBloc>().add(DeleteTodo(todo: todo));
              },
            );
          },
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
