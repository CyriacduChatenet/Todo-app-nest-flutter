import 'package:client/blocs/users/users_bloc.dart';
import 'package:client/models/user_model.dart';
import 'package:flutter/material.dart';

import 'package:client/widgets/navbar_widget.dart';
import 'package:client/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userEmail = '';

  void _logout() {
    AuthRepository().logout();
    Navigator.pushNamed(context, '/signin');
  }

  Future<void> _decodeToken() async {
    final token = await const FlutterSecureStorage().read(key: 'token');
    final decodedToken = Jwt.parseJwt(token ?? '');
    setState(() {
      userEmail = decodedToken['email'];
    });
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await _decodeToken();
    context.read<UsersBloc>().add(GetUser(userEmail: userEmail));
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
            BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                if (state is UsersLoading) {
                  return const CircularProgressIndicator();
                } else if (state is UsersLoaded) {
                  List<User> users = state.users;
                  return Column(
                    children: [
                      for (User user in users)
                        ListTile(
                          title: Text(user.username ?? ''),
                          subtitle: Text(user.email),
                        ),
                    ],
                  );
                } else if (state is UsersError) {
                  return Text('Error: ${state.message}');
                } else {
                  return Container();
                }
              },
            ),
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
