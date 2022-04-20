import 'package:digital_marketing/dao/models.dart';
import 'package:digital_marketing/extra_screen/cource_detail_page.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  static const routeName = '/testpage';
  const TestPage({Key? key}) : super(key: key);
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) {
        return const TestPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: ElevatedButton(
                child: const Text('Cource Card Test'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text('Cource Card Test'),
                          ),
                          body: CourceCardTest(
                            cource: CourceModel.cources[0],
                          ),
                        );
                      },
                    ),
                  );
                },
              )),
          // Container(
          //   padding: const EdgeInsets.all(4),
          //   decoration: BoxDecoration(
          //     color: Colors.amber,
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          //   child: Text(),
          // )
        ],
      ),
    );
  }
}

class CourceCardTest extends StatelessWidget {
  final double widthFactor;
  final CourceModel cource;
  const CourceCardTest({Key? key, required this.cource, this.widthFactor = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          CourceDetailPage.routeName,
          arguments: cource,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: MediaQuery.of(context).size.width / widthFactor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 160,
                  child: Image.network(
                    cource.courceUrl,
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
              width: MediaQuery.of(context).size.width / widthFactor,
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
