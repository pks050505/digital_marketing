import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SplashPage());
  }
  // static const routeName = 'splace';
  // static Route route() {
  //   return MaterialPageRoute(
  //     settings: const RouteSettings(name: routeName),
  //     builder: ((context) {
  //       return SplashPage();
  //     }),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
            child: Text(
          'Splace Screen',
          style: Theme.of(context).textTheme.headline2!
            ..copyWith(
              color: Colors.white,
            ),
        )),
      ),
    );
  }
}
