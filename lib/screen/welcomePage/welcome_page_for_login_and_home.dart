import 'package:digital_marketing/screen/authentication/login_screen.dart';
import 'package:digital_marketing/screen/home_page.dart';
import 'package:digital_marketing/screen/onboarding/onboarding_screen.dart';
import 'package:digital_marketing/service/auth_service.dart';
import 'package:digital_marketing/service/local_db.dart';
import 'package:flutter/material.dart';

// This class is for navigation between Login Screen and Home Screen

class WelcomePageForLoginAndHome extends StatefulWidget {
  static const routeName = '/welcome_page';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: ((context) {
        return WelcomePageForLoginAndHome();
      }),
    );
  }

  const WelcomePageForLoginAndHome({Key? key}) : super(key: key);

  @override
  State<WelcomePageForLoginAndHome> createState() =>
      _WelcomePageForLoginAndHomeState();
}

class _WelcomePageForLoginAndHomeState
    extends State<WelcomePageForLoginAndHome> {
  final AuthService authService = AuthServiceImpl();
  final LocalDatabase localDatabase = LocalDatabaseImpl();

  @override
  Widget build(BuildContext context) {
    if (localDatabase.isFirstTimeOpened()) {
      return OnBoardingScreen();
    }
    if (authService.isAuthenticated()) {
      return HomePage();
    } else {
      return LoginScreen();
    }
  }
}
