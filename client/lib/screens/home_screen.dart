import 'package:flutter/material.dart';

import 'package:client/widgets/todo/createTodoForm_widget.dart';
import 'package:client/widgets/navbar_widget.dart';
import 'package:client/widgets/todo/todoList_widget.dart';

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
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 128, 196, 251),
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
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}
