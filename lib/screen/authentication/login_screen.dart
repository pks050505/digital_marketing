import 'package:digital_marketing/screen/root_page/root_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LoginScreen(),
    );
  }

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            Text(
              'Login',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 100),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'abc@gmail.com',
                label: Text(
                  'email',
                ),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter Your Password',
                label: Text('Password'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RootPage.routeName);
                // Navigator.pushReplacementNamed(context, RootPage.routeName);
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () async {
                const url = "https://www.idigitalpreneur.com/login";

                if (await canLaunch(url)) {
                  launch(url);
                }
              },
              child: const Text('Create account'),
            )
          ],
        ),
      ),
    );
  }
}
