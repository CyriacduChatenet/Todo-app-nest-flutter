import 'package:client/services/todo.service.dart';
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

  final todoService = TodoService();

  void _handleCheck(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  void _handleSubmit() {
    final title = _titleController
        .text; // Mettez à jour le contrôleur avec la valeur actuelle
    final content = _contentController
        .text; // Mettez à jour le contrôleur avec la valeur actuelle

    todoService.createTodo(
      title: title,
      content: content,
      completed: _isChecked,
    );

    print('Title: $title'); // Utilisez la valeur mise à jour
    print('Content: $content'); // Utilisez la valeur mise à jour
    print('Completed: $_isChecked');
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
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
