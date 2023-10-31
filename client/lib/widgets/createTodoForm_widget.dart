import 'package:client/blocs/todo/todo_bloc.dart';
import 'package:client/repository/todo_repository.dart';
import 'package:client/services/todo_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreateTodoForm extends StatelessWidget {
  CreateTodoForm({Key? key})
      : todoService = TodoService(TodoRepository(), TodoBloc());

  final TodoService todoService;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool completed = false;

  _submit() {
    final title = titleController.text;
    final description = descriptionController.text;
    if (title.isNotEmpty && description.isNotEmpty) {
      print('Title: $title');
      print('Description: $description');
      print('Completed: $completed');
    } else {
      print('Title and description must not be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          const Text('Title'),
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a title',
            ),
          ),
          const SizedBox(height: 16),
          const Text('Description'),
          TextFormField(
            controller: descriptionController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a description',
            ),
          ),
          const SizedBox(height: 16),
          const Text('Completed'),
          Checkbox(
            value: false,
            onChanged: (bool? value) {
              if (kDebugMode) {
                print('Checkbox value: $value');
              }
              completed = value!;
              print('Completed value: $completed');
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _submit,
            child: const Text('Create Todo'),
          ),
        ],
      ),
    );
  }
}
