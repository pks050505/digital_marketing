import 'package:digital_marketing/dao/models.dart';
import 'package:digital_marketing/extra_screen/cource_detail_page.dart';
import 'package:flutter/material.dart';

class InstructorItem extends StatelessWidget {
  const InstructorItem({Key? key, required this.instructor}) : super(key: key);
  final InstructorModel instructor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          // Container(
          //   height: 200,
          //   decoration: BoxDecoration(
          //     border: Border.all(),
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          //   child: Image.network(courceUrl),
          // ),
          SizedBox(
            height: 160,
            child: FadeInImage.assetNetwork(
              image: instructor.instructorPic,
              placeholder: 'assert/loading.gif',
              fit: BoxFit.cover,
            ),
          ),
          // const SizedBox(height: 10),
          ListTile(
            title: Text(
              instructor.name,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(instructor.name),
          )
        ],
      ),
    );
  }
}
