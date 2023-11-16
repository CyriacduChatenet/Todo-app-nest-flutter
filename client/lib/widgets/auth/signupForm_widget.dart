import 'package:client/models/user_model.dart';
import 'package:flutter/material.dart';

import 'package:client/repository/auth_repository.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({Key? key}) : super(key: key);

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  void _onSubmit() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final username = _usernameController.text;

    final newUser = await AuthRepository()
        .signup(email: email, password: password, username: username);

    if (newUser != null) {
      print('Signup successful, navigating to /signin');
      Navigator.pushReplacementNamed(context, '/signin');
    } else {
      print('Signup failed, newUser is null');
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
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
              ),
            ),
            const SizedBox(height: 24),
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
            ElevatedButton(
              onPressed: _onSubmit,
              child: const Text('Signup'),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                // Utilisez une fonction anonyme pour la navigation
                Navigator.pushNamed(context, '/signin');
              },
              child: const Text('I have an account? Signin'),
            ),
          ],
        ),
      ),
    );
  }
}
