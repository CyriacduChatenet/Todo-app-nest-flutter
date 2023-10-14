import 'package:flutter/material.dart';

class CreateTodoFormWidget extends StatefulWidget {
  const CreateTodoFormWidget({super.key});

  @override
  State<CreateTodoFormWidget> createState() => _CreateTodoFormWidgetState();
}

class _CreateTodoFormWidgetState extends State<CreateTodoFormWidget> {
  bool _isChecked = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  String get todoTitle => _titleController.text;
  String get todoContent => _contentController.text;

  void _handleCheck(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  void _handleSubmit () {
    print('Title: $todoTitle');
    print('Content: $todoContent');
    print('Completed: $_isChecked');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        const Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Todo title',
              ),
            )),
        const Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Todo content',
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              const Text('Completed'),
              Checkbox(
                value: _isChecked,
                onChanged: _handleCheck,
              ),
            ],
          ),
        ),
        FloatingActionButton(
          onPressed: _handleSubmit,
          tooltip: 'Add todo',
          child: const Icon(Icons.add),
        ),
      ],
    ));
  }
}
