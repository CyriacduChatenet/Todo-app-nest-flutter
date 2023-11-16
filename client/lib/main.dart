import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:client/blocs/todos/todos_bloc.dart';
import 'package:client/blocs/todos/todos_event.dart';
import 'package:client/repository/todo_repository.dart';
import 'package:client/screens/auth/signin_screen.dart';
import 'package:client/screens/auth/signup_screen.dart';
import 'package:client/screens/auth/forgotPassword_screen.dart';
import 'package:client/screens/profile_screen.dart';
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
            initialRoute: '/signin',
            routes: {
              '/signin': (context) => const SigninScreen(),
              '/signup': (context) => const SignupScreen(),
              '/forgot-password': (context) => const ForgotPasswordScreen(),
              '/': (context) => const HomeScreen(),
              '/profile': (context) => const ProfileScreen(),
            },
          ),
        ));
  }
}
