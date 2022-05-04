import 'package:digital_marketing/screen/home_page.dart';
import 'package:flutter/material.dart';

class CourceItemTest extends StatelessWidget {
  const CourceItemTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: size / 2,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.network(
              imageUrll,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  child: Wrap(
                    children: [
                      Text(
                        'Learn Digital Marketing',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text('By Instructor name')
              ],
            ),
          )
        ],
      ),
    );
  }
}
