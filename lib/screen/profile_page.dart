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
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        minRadius: 40,
                        maxRadius: 60,
                        backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/men/47.jpg"),
                      ),
                      Text(
                        'Purushottam kumar',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'pks050505@gmail.com',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '9123456789',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Package Type',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                Text('Design and color will deside later')
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
