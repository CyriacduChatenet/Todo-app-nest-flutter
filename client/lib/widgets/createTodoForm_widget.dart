import 'package:client/blocs/todos/todos_bloc.dart';
import 'package:client/blocs/todos/todos_event.dart';
import 'package:client/models/todo_model.dart';
import 'package:client/repository/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTodoForm extends StatefulWidget {
  const CreateTodoForm({Key? key}) : super(key: key);

  @override
  _CreateTodoFormState createState() => _CreateTodoFormState();
}

class _CreateTodoFormState extends State<CreateTodoForm> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Enter todo title',
              labelText: 'Title',
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 8.0)),
          TextFormField(
            controller: contentController,
            decoration: const InputDecoration(
              hintText: 'Enter todo content',
              labelText: 'Content',
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 32.0)),
          ElevatedButton(
            onPressed: () async {
              final todo = Todo(
                title: titleController.text,
                content: contentController.text,
                completed: false,
              );

              final newTodo = await TodoRepository().createTodo(todo);
              context.read<TodosBloc>().add(AddTodo(todo: newTodo));

              titleController.clear();
              contentController.clear();
            }, // Remove the parentheses here
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors
                  .blue), // Fix 'MaterialStatePropertyAll' to 'MaterialStateProperty.all'
            ),
            child: const Text(
              'Submit',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
