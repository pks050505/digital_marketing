import 'package:flutter/material.dart';

import '../dao/cource_model.dart';
import '../extra_screen/cource_detail_page.dart';

class CourceItem extends StatelessWidget {
  final double widthFactor;
  final CourceModel cource;
  const CourceItem({Key? key, required this.cource, required this.widthFactor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          CourceDetailPage.routeName,
          arguments: cource,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10, bottom: 10),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 140,
                  width: width,
                  child: FadeInImage.assetNetwork(
                    image: cource.courceUrl,
                    placeholder: 'assert/loading.gif',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    color: Colors.amber,
                    child: Text(cource.courceCategory),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                cource.courceName,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: width,
              height: 40,
              child: Row(
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
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        cource.rating.toString(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
