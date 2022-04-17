import 'package:digital_marketing/widgets/cource_item.dart';
import 'package:digital_marketing/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class CourcesPage extends StatelessWidget {
  static const routeName = '/cource_page';
  const CourcesPage({Key? key}) : super(key: key);
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CourcesPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cources"),
        centerTitle: true,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: Column(
        children: [
          JoinedCources(),
          AllCources(),
        ],
      ),
      // body: GridView.builder(
      //   physics: BouncingScrollPhysics(),
      //   shrinkWrap: true,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     crossAxisSpacing: 5.0,
      //     mainAxisSpacing: 5.0,
      //   ),
      //   itemCount: 12,
      //   itemBuilder: (_, i) {
      //     return Container(
      //       child: CourceItem(),
      //     );
      //   },
      // ),
    );
  }
}

class JoinedCources extends StatelessWidget {
  const JoinedCources({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'My Cource',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                return CourceItem();
              },
            ),
          )
        ],
      ),
    );
  }
}

class AllCources extends StatelessWidget {
  const AllCources({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'All Cources',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: 40,
              itemBuilder: (_, i) {
                return CourceItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
