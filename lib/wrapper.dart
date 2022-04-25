import 'package:digital_marketing/bloc/authentication/authentication_bloc.dart';
import 'package:digital_marketing/screen/authentication/login_screen.dart';
import 'package:digital_marketing/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  static const routeName = '/wrapper';

  static MaterialPageRoute route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) {
        return const Wrapper();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: ((context, state) {
        if (state is AuthenticatedState) {
          return HomePage();
        } else if (state is UnAuthenticatedState) {
          return LoginScreen();
        } else if (state is AuthenticationInitial) {
          return Scaffold(
            body: Center(child: Text('Splace')),
          );
        }
        return Container(
          child: const Center(child: Text('From Wrapper')),
        );
      }),
    );
  }
}
