import 'dart:math';

import 'package:digital_marketing/screen/all_course_page.dart';

import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const routeName = '/search_page';

  static Route route() {
    return PageRouteBuilder(
      settings: const RouteSettings(name: routeName),
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SearchPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> options = [
      'Finance',
      'Education',
      'Video Editing',
      'Trading',
      'Education',
      'Video Editing',
      'Trading',
      'Finance',
      'Education',
      'Video Editing',
      'Trading',
      'Education',
    ];
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: (details) {
          Navigator.pop(context);
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 30, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.black),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close))
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 30,
                    ),
                    label: Text(
                      'What do you want to learn today?',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 10),
                child: Text(
                  'Popular',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.black),
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return AllCoursePage();
                      }));
                    },
                    child: Card(
                      color: Colors.amber[Random().nextInt(9) * 100],
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(options[index]),
                      ),
                    ),
                  );
                },
                childCount: options.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
