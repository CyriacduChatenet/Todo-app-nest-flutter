import 'package:client/blocs/todos/todos_bloc.dart';
import 'package:client/blocs/todos/todos_event.dart';
import 'package:client/repository/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:client/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => TodoRepository(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => TodosBloc(
                      RepositoryProvider.of<TodoRepository>(context),
                    )..add(LoadTodo()))
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            home: const HomeScreen(),
          ),
        ));
  }
}
