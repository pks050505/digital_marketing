import 'package:digital_marketing/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ExploreSearchPage extends StatelessWidget {
  static const routeName = '/explore_search';
  const ExploreSearchPage({Key? key}) : super(key: key);
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) {
        return const ExploreSearchPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      // bottomNavigationBar: const CustomNavBar(),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Comming soon...'),
              ],
            )
            // DrawerHeader(
            //   child: Center(
            //     child: Column(
            //       children: [
            //         CircleAvatar(
            //           minRadius: 40,
            //           maxRadius: 60,
            //         ),
            //         Text(
            //           'Purushottam kumar',
            //           style: Theme.of(context).textTheme.headline5,
            //         )
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
