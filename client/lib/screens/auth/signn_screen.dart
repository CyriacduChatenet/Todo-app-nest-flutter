import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signin'),
        automaticallyImplyLeading: false,
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 24.0, right: 24.0, left: 24.0),
        child: Column(
          children: [Text('Form')],
        ),
      ),
    );
    ;
  }
}
