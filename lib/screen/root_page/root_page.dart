import 'package:digital_marketing/screen/cources_page.dart';
import 'package:digital_marketing/screen/home_page.dart';
import 'package:digital_marketing/screen/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);
  static const routeName = '/root_page';
  static Route route() {
    return RootPage.route();
  }
  // static Route route() {
  //   return MaterialPageRoute<void>(builder: (_) => RootPage());
  // }

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  int currentIndex = 0;
  final screens = const [
    HomePage(),
    CourcesPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        //keep all children alive
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          elevation: 5.0,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.construction),
              label: 'my course',
            ),
            // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
            BottomNavigationBarItem(
              icon: Icon(Icons.verified_user),
              label: 'profile',
            ),
            // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          ],
        ),
      ),
    );
  }
}
