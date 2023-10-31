import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreateTodoForm extends StatelessWidget {
  CreateTodoForm({Key? key});

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

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
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (kDebugMode) {
                print('hello');
              }
            },
            child: const Text('Create Todo'),
          ),
        ],
      ),
    );
  }
}
