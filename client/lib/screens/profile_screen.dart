import 'package:client/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 24.0, right: 24.0, left: 24.0),
        child: Column(
          children: [
            Text('Profile'),
          ],
        ),
      ),
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}
