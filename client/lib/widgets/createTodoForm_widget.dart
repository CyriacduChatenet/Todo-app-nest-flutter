import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreateTodoForm extends StatelessWidget {
  const CreateTodoForm({Key? key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          const Text('Title'),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a title',
            ),
          ),
          const SizedBox(height: 16),
          const Text('Description'),
          const TextField(
            decoration: InputDecoration(
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
