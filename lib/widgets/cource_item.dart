import 'package:digital_marketing/dao/user.dart';
import 'package:flutter/material.dart';

class CourceItem extends StatelessWidget {
  final Cource cource;
  const CourceItem({Key? key, required this.cource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 250,
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                child: Image.network(cource.image!),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(cource.cource_category!),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              cource.title!,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/men/47.jpg"),
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Paras Goal',
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  Text('4.3')
                ],
              )
            ],
          ),
          // Divider(),
          // Align(
          //   alignment: Alignment.topRight,
          //   child: TextButton(
          //     child: Text(
          //       "Learn More",
          //       style: TextStyle(
          //           color: Colors.blue,
          //           fontSize: 16,
          //           fontWeight: FontWeight.bold),
          //     ),
          //     onPressed: () {},
          //   ),
          // )
          // TextButton(
          //   child: Text("Learn More"),
          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }
}
