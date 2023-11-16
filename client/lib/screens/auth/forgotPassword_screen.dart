import 'package:flutter/material.dart';

import 'package:client/widgets/auth/forgotPasswordForm_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        automaticallyImplyLeading: false,
      ),
      body: const Padding(
          padding: EdgeInsets.only(top: 24.0, right: 24.0, left: 24.0),
          child: ForgotPasswordFormWidget()),
    );
  }
}
