import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';

import 'package:client/repository/auth_repository.dart';
import 'package:client/blocs/users/users_bloc.dart';
import 'package:client/models/user_model.dart';
import 'package:client/repository/user_repository.dart';

class SigninFormWidget extends StatefulWidget {
  const SigninFormWidget({Key? key}) : super(key: key);

  @override
  State<SigninFormWidget> createState() => _SigninFormWidgetState();
}

class _SigninFormWidgetState extends State<SigninFormWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _createUserByJwt({required String token}) async {
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    String userEmail = payload['email'];
    User newUser = await UserRepository().findUserByEmail(email: userEmail);
    context.read<UsersBloc>().add(AddUser(user: newUser));
  }

  void _onSubmit() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final token =
        await AuthRepository().signin(email: email, password: password);

    if (token != null) {
      _createUserByJwt(token: token);

      Navigator.pushReplacementNamed(context, '/');
    } else {
      throw Exception('Signin failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                // Utilisez une fonction anonyme pour la navigation
                Navigator.pushNamed(context, '/forgot-password');
              },
              child: const Text('Forgot password?'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _onSubmit,
              child: const Text('Signin'),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                // Utilisez une fonction anonyme pour la navigation
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text('Don\'t have an account? Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
