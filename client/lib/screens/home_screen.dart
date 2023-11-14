import 'package:client/widgets/createTodoForm_widget.dart';
import 'package:client/widgets/todoList_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 24.0, right: 24.0, left: 24.0),
        child: Column(
          children: [
            CreateTodoForm(),
            TodoListWidget(),
          ],
        ),
      ),
    );
  }
}
