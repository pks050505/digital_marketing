import 'package:digital_marketing/screen/cource_detail_page.dart';
import 'package:digital_marketing/screen/cources_page.dart';
import 'package:digital_marketing/screen/home_page.dart';
import 'package:digital_marketing/screen/profile_page.dart';
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
      initialRoute: HomePage.routeName,
      onGenerateRoute: (settings) {
        if (settings.name == HomePage.routeName) {
          return HomePage.route();
        }
        if (settings.name == CourcesPage.routeName) {
          return CourcesPage.route();
        }
        if (settings.name == ProfilePage.routeName) {
          return ProfilePage.route();
        }
        if (settings.name == CourceDetailPage.routeName) {
          return CourceDetailPage.route();
        }
      },
    );
  }
}
