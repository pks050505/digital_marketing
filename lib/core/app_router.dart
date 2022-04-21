import 'package:digital_marketing/dao/models.dart';
import 'package:digital_marketing/extra_screen/cource_detail_page.dart';
import 'package:digital_marketing/screen/authentication/login_screen.dart';
import 'package:digital_marketing/screen/cources_page.dart';
import 'package:digital_marketing/screen/explore_search.dart';
import 'package:digital_marketing/screen/featured_page.dart';
import 'package:digital_marketing/screen/home_page.dart';
import 'package:digital_marketing/screen/onboarding/onboarding_screen.dart';
import 'package:digital_marketing/screen/welcomePage/welcome_page_for_login_and_home.dart';
import 'package:digital_marketing/test_page.dart';

import 'package:flutter/material.dart';
import '../screen/profile_page.dart';
import '../screen/welcomePage/welcome_page_for_login_and_home.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return HomePage.route();
      case CourcesPage.routeName:
        return CourcesPage.route();
      case ProfilePage.routeName:
        return ProfilePage.route();
      case CourceDetailPage.routeName:
        return CourceDetailPage.route(
            cource: settings.arguments as CourceModel);
      case ExploreSearchPage.routeName:
        return ExploreSearchPage.route();
      case FeaturedPage.routeName:
        return FeaturedPage.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case OnBoardingScreen.routeName:
        return OnBoardingScreen.route();
      case WelcomePageForLoginAndHome.routeName:
        return WelcomePageForLoginAndHome.route();
      case TestPage.routeName:
        return TestPage.route();
      default:
        return HomePage.route();
    }
  }

  static Route _errorPage() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error Page')),
        body: const Center(
          child: Text('Something went wrong...'),
        ),
      );
    });
  }
}
