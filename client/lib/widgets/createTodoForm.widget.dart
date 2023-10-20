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

  final todoService = TodoService();
  void _handleCheck(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _submitForm() {
    String title = _titleController.text;
    String content = _contentController.text;
    todoService.createTodo(title: title, content: content, completed: _isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          controller: _titleController,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: _contentController,
          decoration: const InputDecoration(labelText: 'Content'),
        ),
        const SizedBox(height: 20),
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
          onPressed: _submitForm,
          tooltip: 'Add todo',
          child: const Icon(Icons.add),
        ),
      ],
    ));
  }
}
