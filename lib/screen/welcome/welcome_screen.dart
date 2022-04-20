import 'package:digital_marketing/screen/home_page.dart';
import 'package:digital_marketing/screen/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isAuthenticated = false;
  bool isFirstTimeOpened = true;
  @override
  Widget build(BuildContext context) {
    if (isAuthenticated) {
      return HomePage();
    } else if (isFirstTimeOpened) {
      return OnBoardingScreen();
    }
    return Container();
  }
}
