import 'package:digital_marketing/dao/cource_model.dart';

import 'package:digital_marketing/widgets/cource_item.dart';
import 'package:digital_marketing/widgets/section_title.dart';
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
        //some error found need to fix
        automaticallyImplyLeading: false,
      ),

      body: Container(
        margin: const EdgeInsets.only(left: 8),
        child: Column(
          children: [
            JoinedCources(
              joinedCources: CourceModel.cources,
            ),
            const Divider(),
            AllCources(
              allCources: CourceModel.cources,
            ),
          ],
        ),
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
    return Column(
      children: [
        const SectionTitle(title: 'My Cource'),
        const SizedBox(height: 10),
        SizedBox(
          height: 230,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: joinedCources.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) {
              return CourceItem(
                cource: joinedCources[i],
                widthFactor: 2,
              );
            },
          ),
        )
      ],
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
          SectionTitle(title: 'All Cources'),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: allCources.length,
              itemBuilder: (_, i) {
                return CourceItem(
                  cource: allCources[i],
                  widthFactor: 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
