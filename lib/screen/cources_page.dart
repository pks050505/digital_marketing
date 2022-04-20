import 'package:digital_marketing/dao/cource_model.dart';
import 'package:digital_marketing/test_page.dart';
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
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: Column(
        children: [
          JoinedCources(
            joinedCources: CourceModel.cources,
          ),
          AllCources(allCources: CourceModel.cources),
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
  const JoinedCources({Key? key, required this.joinedCources})
      : super(key: key);
  final List<CourceModel> joinedCources;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height / 3,
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
          const SizedBox(height: 10),
          SizedBox(
            height: 165,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: joinedCources.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                return CourceCardTest(cource: joinedCources[i]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class AllCources extends StatelessWidget {
  const AllCources({Key? key, required this.allCources}) : super(key: key);
  final List<CourceModel> allCources;

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
              itemCount: allCources.length,
              itemBuilder: (_, i) {
                return CourceItem(
                  cource: allCources[i],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
