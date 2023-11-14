import 'package:flutter/material.dart';

class CreateTodoForm extends StatefulWidget {
  const CreateTodoForm({Key? key}) : super(key: key);

  @override
  _CreateTodoFormState createState() => _CreateTodoFormState();
}

class _CreateTodoFormState extends State<CreateTodoForm> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  void _addTodo() {
    print('Add todo button pressed');
  }

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
            onPressed: _addTodo, // Remove the parentheses here
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
