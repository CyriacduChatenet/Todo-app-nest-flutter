import 'package:flutter/material.dart';

import 'package:client/widgets/navbar_widget.dart';
import 'package:client/repository/auth_repository.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _logout() {
    AuthRepository().logout();
    Navigator.pushNamed(context, '/signin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0, right: 24.0, left: 24.0),
        child: Column(
          children: [
            const Text('Profile'),
            Center(
              child: ElevatedButton(
                onPressed: _logout,
                child: const Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}
