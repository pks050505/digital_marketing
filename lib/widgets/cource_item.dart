import 'package:flutter/material.dart';

class CourceItem extends StatelessWidget {
  const CourceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      width: 250,
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                child: Image.network(
                  'https://media.istockphoto.com/photos/portrait-of-smiling-diverse-people-raising-hands-at-seminar-picture-id1342228491?b=1&k=20&m=1342228491&s=170667a&w=0&h=rZuhcq_sbRYQIVWFfsDdqFi6XeQwcwR8gs7ZIlTrVQ8=',
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text('Finance'),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Share Market Xpert",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 10),
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
