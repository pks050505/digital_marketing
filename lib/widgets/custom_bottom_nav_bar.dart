import 'package:digital_marketing/screen/cources_page.dart';
import 'package:digital_marketing/screen/explore_search.dart';
import 'package:digital_marketing/screen/featured_page.dart';
import 'package:digital_marketing/screen/home_page.dart';
import 'package:digital_marketing/screen/profile_page.dart';
import 'package:flutter/material.dart';

// class CustomBottomNavigationBar extends StatefulWidget {
//   const CustomBottomNavigationBar({Key? key}) : super(key: key);

//   @override
//   State<CustomBottomNavigationBar> createState() =>
//       _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   @override
//   Widget build(BuildContext context) {
//     ValueNotifier _currentvalue = ValueNotifier(0);
//     return ValueListenableBuilder(
//       valueListenable: _currentvalue,
//       builder: (_, dynamic, child) {
//         return BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           currentIndex: _currentvalue.value,

//           // backgroundColor: Theme.of(context).primaryColor,
//           onTap: (i) {
//             _currentvalue.value = i;
//             switch (_currentvalue.value) {
//               case 0:
//                 Navigator.pushReplacementNamed(context, HomePage.routeName);
//                 break;
//               case 1:
//                 Navigator.pushNamed(context, ProfilePage.routeName);
//                 break;
//               case 2:
//                 Navigator.pushNamed(context, CourcesPage.routeName);
//                 break;
//               default:
//             }
//           },

//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               label: "Home",
//               icon: Icon(Icons.home),
//             ),
//             BottomNavigationBarItem(
//               label: "Profile",
//               icon: Icon(Icons.verified_user_outlined),
//             ),
//             BottomNavigationBarItem(label: "Cources", icon: Icon(Icons.face)),
//             BottomNavigationBarItem(label: "Explore", icon: Icon(Icons.search)),
//             BottomNavigationBarItem(label: "Featured", icon: Icon(Icons.abc)),
//           ],
//         );
//       },
//       // BottomNavigationBar(
//       //   type: BottomNavigationBarType.fixed,
//       //   currentIndex: _currentvalue.value,
//       //   // backgroundColor: Theme.of(context).primaryColor,
//       //   onTap: (i) {
//       //     setState(() {
//       //       _selectedIndex = i;
//       //       print(_selectedIndex);
//       //     });
//       //   },
//       //   items: <BottomNavigationBarItem>[
//       //     BottomNavigationBarItem(
//       //       label: "Profile",
//       //       icon: Icon(Icons.verified_user_outlined),
//       //     ),
//       //     BottomNavigationBarItem(label: "Cources", icon: Icon(Icons.face)),
//       //     BottomNavigationBarItem(label: "Explore", icon: Icon(Icons.search)),
//       //     BottomNavigationBarItem(label: "Featured", icon: Icon(Icons.abc)),
//       //   ],
//       // );
//     );
//   }
// }

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: SizedBox(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NavBarItem(
              iconData: Icons.home,
              isSelected: true,
              title: 'Home',
              onTap: () {
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              },
            ),
            NavBarItem(
              iconData: Icons.check_circle,
              isSelected: false,
              title: 'Profile',
              onTap: () {
                Navigator.pushReplacementNamed(context, ProfilePage.routeName);
              },
            ),
            NavBarItem(
              iconData: Icons.leaderboard,
              title: 'Cources',
              isSelected: false,
              onTap: () {
                Navigator.pushReplacementNamed(context, CourcesPage.routeName);
              },
            ),
            NavBarItem(
              iconData: Icons.search,
              title: 'Search',
              isSelected: false,
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, ExploreSearchPage.routeName);
              },
            ),
            NavBarItem(
              iconData: Icons.filter_alt_rounded,
              title: "Featured",
              isSelected: false,
              onTap: () {
                Navigator.pushReplacementNamed(context, FeaturedPage.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function()? onTap;
  final bool isSelected;
  const NavBarItem(
      {Key? key,
      required this.iconData,
      required this.title,
      this.onTap,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedColor = Theme.of(context).primaryColor;
    var unSelectedColor = Colors.grey;
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: isSelected ? selectedColor : unSelectedColor,
          ),
          const SizedBox(height: 3),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? selectedColor : unSelectedColor,
            ),
          ),
        ],
      ),
    );
  }
}
