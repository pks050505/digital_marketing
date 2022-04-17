import 'package:digital_marketing/screen/cources_page.dart';
import 'package:digital_marketing/screen/home_page.dart';
import 'package:digital_marketing/screen/profile_page.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    ValueNotifier _currentvalue = ValueNotifier(0);
    return ValueListenableBuilder(
      valueListenable: _currentvalue,
      builder: (_, dynamic, child) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentvalue.value,

          // backgroundColor: Theme.of(context).primaryColor,
          onTap: (i) {
            _currentvalue.value = i;
            switch (_currentvalue.value) {
              case 0:
                Navigator.pushReplacementNamed(context, HomePage.routeName);
                break;
              case 1:
                Navigator.pushNamed(context, ProfilePage.routeName);
                break;
              case 2:
                Navigator.pushNamed(context, CourcesPage.routeName);
                break;
              default:
            }
          },

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.verified_user_outlined),
            ),
            BottomNavigationBarItem(label: "Cources", icon: Icon(Icons.face)),
            BottomNavigationBarItem(label: "Explore", icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "Featured", icon: Icon(Icons.abc)),
          ],
        );
      },
      // BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: _currentvalue.value,
      //   // backgroundColor: Theme.of(context).primaryColor,
      //   onTap: (i) {
      //     setState(() {
      //       _selectedIndex = i;
      //       print(_selectedIndex);
      //     });
      //   },
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       label: "Profile",
      //       icon: Icon(Icons.verified_user_outlined),
      //     ),
      //     BottomNavigationBarItem(label: "Cources", icon: Icon(Icons.face)),
      //     BottomNavigationBarItem(label: "Explore", icon: Icon(Icons.search)),
      //     BottomNavigationBarItem(label: "Featured", icon: Icon(Icons.abc)),
      //   ],
      // );
    );
  }
}
