import 'package:digital_marketing/core/app_router.dart';
import 'package:digital_marketing/screen/onboarding/onboarding_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Marketing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: OnBoardingScreen.routeName,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
