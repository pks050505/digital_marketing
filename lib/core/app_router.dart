import 'package:digital_marketing/dao/models.dart';
import 'package:digital_marketing/screen/cource_detail_page.dart';
import 'package:digital_marketing/screen/all_course_page.dart';
import 'package:digital_marketing/screen/search_page.dart';
import 'package:digital_marketing/welcomepage.dart';

import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      // case RootPage.routeName:
      //   return RootPage.route();
      // case LoginScreen.routeName:
      //   return LoginScreen.route();
      // case OnBoardingScreen.routeName:
      //   return OnBoardingScreen.route();
      // case CourceDetailPage.routeName:
      //   return CourceDetailPage.route(
      //       cource: settings.arguments as CourceModel);
      case CourceDetailScreen.routeName:
        return CourceDetailScreen.route(
            courceModel: settings.arguments as CourceModel);
      case WelcomePage.routeName:
        return WelcomePage.route();
      case AllCoursePage.routeName:
        return AllCoursePage.route();
      case SearchPage.routeName:
        return SearchPage.route();
      // case HomePage.routeName:
      //   return HomePage.route();
      // case CourcesPage.routeName:
      //   return CourcesPage.route();
      // case ProfilePage.routeName:
      //   return ProfilePage.route();

      // case ExploreSearchPage.routeName:
      //   return ExploreSearchPage.route();
      // case FeaturedPage.routeName:
      //   return FeaturedPage.route();

      default:
        return _errorPage();
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
