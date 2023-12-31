import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:client/blocs/todos/todos_bloc.dart';
import 'package:client/blocs/todos/todos_event.dart';
import 'package:client/repository/todo_repository.dart';
import 'package:client/blocs/users/users_bloc.dart';
import 'package:client/repository/user_repository.dart';
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => UserRepository()),
        RepositoryProvider(create: (context) => TodoRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TodosBloc(
              RepositoryProvider.of<TodoRepository>(context),
            )..add(const LoadTodo()),
          ),
          BlocProvider(
            create: (context) => UsersBloc(
              RepositoryProvider.of<UserRepository>(context),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.blue,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue,
            ),
          ),
          home: FutureBuilder(
            future: const FlutterSecureStorage().read(key: 'token'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final String? token = snapshot.data;
                final String initialRoute =
                    token != null && token.isNotEmpty ? '/' : '/signin';

                return MaterialApp(
                  initialRoute: initialRoute,
                  routes: {
                    '/signin': (context) => const SigninScreen(),
                    '/signup': (context) => const SignupScreen(),
                    '/forgot-password': (context) =>
                        const ForgotPasswordScreen(),
                    '/': (context) => const HomeScreen(),
                    '/profile': (context) => const ProfileScreen(),
                  },
                  debugShowCheckedModeBanner: false,
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
