import 'package:flutter/material.dart';
import '../dao/cource_model.dart';
import '../extra_screen/cource_detail_page.dart';

class CourceItem extends StatelessWidget {
  final double widthFactor;
  final CourceModel cource;
  const CourceItem({
    Key? key,
    required this.cource,
    required this.widthFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          CourceDetailScreen.routeName,
          arguments: cource,
        );
      },
      child: Card(
        shadowColor: Colors.pinkAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 100,
                  width: width,
                  child: Image.network(
                    cource.courceUrl,
                    fit: BoxFit.cover,
                  ),
                  // child: FadeInImage.assetNetwork(
                  //   image: cource.courceUrl,
                  //   placeholder: 'asserts/images/loading.gif',
                  //   fit: BoxFit.cover,
                  // ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Card(
                    elevation: 5,
                    color: Colors.amberAccent,
                    child: Text(cource.courceCategory),
                  ),
                )
              ],
            ),
            FittedBox(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  cource.courceName,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "By ${cource.instructorName}",
              style: Theme.of(context).textTheme.bodyText1,
            )
            // SizedBox(
            //   height: 40,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Row(
            //         children: [
            //           CircleAvatar(
            //             backgroundImage: NetworkImage(cource.instructorUrl),
            //           ),
            //           const SizedBox(width: 6),
            //           Text(
            //             cource.instructorName,
            //             style: Theme.of(context).textTheme.bodyText1,
            //           )
            //         ],
            //       ),
            //       Row(
            //         children: [
            //           const Icon(
            //             Icons.star,
            //             color: Colors.orange,
            //           ),
            //           const SizedBox(width: 5),
            //           Text(
            //             cource.rating.toString(),
            //           )
            //         ],
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
