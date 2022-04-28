import 'package:flutter/material.dart';

class AllCoursePage extends StatelessWidget {
  static const routeName = 'allcourcepage';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) {
        return const AllCoursePage();
      },
    );
  }

  const AllCoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Course'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Column(
        children: [
          // ListView.builder(
          //   shrinkWrap: true,
          //   itemBuilder: ((context, index) {
          //     return Chip(label: Text('Finance'), elevation: 5);
          //   }),
          // ),
        ],
      ),
    );
  }
}
