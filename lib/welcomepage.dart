import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/authentication/authentication_bloc.dart';
import 'repository/authentication_repository.dart';
import 'screen/authentication/loginpage.dart';
import 'screen/authentication/splace.dart';
import 'screen/root_page/root_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  static const routeName = '/welcome_screen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) {
        return const WelcomePage();
      },
    );
  }

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return const RootPage();
        } else if (state.status == AuthenticationStatus.unauthenticated) {
          return LoginPage();
        }
        return SplashPage();
      },
    );
  }
}





  // switch (state.status) {
              //   case AuthenticationStatus.authenticated:
              //     // Navigator.pushNamedAndRemoveUntil(
              //     //   context,
              //     //   RootPage.routeName,
              //     //   (route) => false,
              //     // );
              //     _navigator.pushAndRemoveUntil<void>(
              //       RootPage.route(),
              //       (route) => false,
              //     );

              //     break;
              //   case AuthenticationStatus.unauthenticated:
              //     _navigator.pushAndRemoveUntil<void>(
              //       LoginPage.route(),
              //       (route) => false,
              //     );

              //     break;
              //   case AuthenticationStatus.unknown:
              //     _navigator.pushAndRemoveUntil<void>(
              //       SplashPage.route(),
              //       (route) => false,
              //     );
              //     break;
              // }
              // return HomePage();