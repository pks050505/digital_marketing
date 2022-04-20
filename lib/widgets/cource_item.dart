import 'package:digital_marketing/dao/cource_model.dart';
import 'package:flutter/material.dart';

class CourceItem extends StatelessWidget {
  final CourceModel cource;
  const CourceItem({Key? key, required this.cource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Todo here inkwell will implement and pass cource object to cource Detail page with Navigator argument
    return Container(
      height: 300,
      width: 250,
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                child: Image.network(cource.courceUrl),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(cource.courceCategory),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              cource.courceName,
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
                    backgroundImage: NetworkImage(cource.instructorUrl),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    cource.instructorName,
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  Text(cource.rating.toString())
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
