import 'package:client/widgets/createTodoForm.widget.dart';
import 'package:client/widgets/todoList.widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Column(
        children: [
          CreateTodoFormWidget(),
          TodoListWidget(),
        ],
      )
    );
  }
}
