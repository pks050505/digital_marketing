import 'package:digital_marketing/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile_page';
  const ProfilePage({Key? key}) : super(key: key);
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) {
        return const ProfilePage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                CircleAvatar(
                  minRadius: 40,
                  maxRadius: 60,
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/men/47.jpg"),
                ),
                Text(
                  'Purushottam kumar',
                  style: Theme.of(context).textTheme.headline5,
                )
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
