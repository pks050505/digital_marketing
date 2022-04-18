import 'package:digital_marketing/extra_screen/cource_detail_page.dart';
import 'package:flutter/material.dart';

class InstructorItem extends StatelessWidget {
  const InstructorItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(courceUrl),
          ),
          // const SizedBox(height: 10),
          ListTile(
            title: Text(
              'Instructor name',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Instructor name'),
          )
        ],
      ),
    );
  }
}
