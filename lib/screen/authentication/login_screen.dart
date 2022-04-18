import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) {
        return const LoginScreen();
      },
    );
  }

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(),
            TextFormField(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
