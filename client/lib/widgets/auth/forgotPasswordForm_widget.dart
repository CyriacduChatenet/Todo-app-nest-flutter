import 'package:flutter/material.dart';

class ForgotPasswordFormWidget extends StatefulWidget {
  const ForgotPasswordFormWidget({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordFormWidget> createState() =>
      _ForgotPasswordFormWidgetState();
}

class _ForgotPasswordFormWidgetState extends State<ForgotPasswordFormWidget> {
  final _emailController = TextEditingController();

  void _onSubmit() {
    final email = _emailController.text;

    print('email: $email');
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
            ElevatedButton(
              onPressed: _onSubmit,
              child: const Text('Forgot password'),
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
