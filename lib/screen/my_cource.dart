import 'package:flutter/material.dart';

class MyCource extends StatelessWidget {
  static const routeName = '/mycource';
  const MyCource({Key? key}) : super(key: key);
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) {
        return const MyCource();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cource'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 2.0,
          ),
          itemBuilder: (_, i) {
            return Container(
              color: Colors.amber,
            );
          }),
    );
  }
}
