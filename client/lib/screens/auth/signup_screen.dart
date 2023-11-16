import 'package:flutter/material.dart';

import 'package:client/widgets/auth/signupForm_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
        automaticallyImplyLeading: false,
      ),
      body: const Padding(
          padding: EdgeInsets.only(top: 24.0, right: 24.0, left: 24.0),
          child: SignupFormWidget()),
    );
  }
}
