import 'package:digital_marketing/dao/cource_model.dart';

import 'package:digital_marketing/widgets/cource_item.dart';
import 'package:digital_marketing/widgets/section_title.dart';
import 'package:flutter/material.dart';

class CourcesPage extends StatelessWidget {
  static const routeName = '/course_page';
  const CourcesPage({Key? key}) : super(key: key);
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CourcesPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Course"),
        centerTitle: true,
        //some error found need to fix
        automaticallyImplyLeading: false,
      ),

      body: Container(
        // margin: const EdgeInsets.only(left: 8),
        child: Column(
          children: [
            Container(
              child: FeatureText(),
            ),
            MyCourseWidget(cources: CourceModel.cources)
            // JoinedCources(
            //   joinedCources: CourceModel.cources,
            // ),
          ],
        ),
      ),
      // body: GridView.builder(
      //   physics: BouncingScrollPhysics(),
      //   shrinkWrap: true,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     crossAxisSpacing: 5.0,
      //     mainAxisSpacing: 5.0,
      //   ),
      //   itemCount: 12,
      //   itemBuilder: (_, i) {
      //     return Container(
      //       child: CourceItem(),
      //     );
      //   },
      // ),
    );
  }
}

class MyCourseWidget extends StatelessWidget {
  final List<CourceModel> cources;
  const MyCourseWidget({Key? key, required this.cources}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemCount: cources.length,
      itemBuilder: (_, i) {
        return CourceItem(
          cource: cources[i],
          widthFactor: 2.5,
        );
      },
    );
  }
}
// class JoinedCources extends StatelessWidget {
//   const JoinedCources({Key? key, required this.joinedCources})
//       : super(key: key);
//   final List<CourceModel> joinedCources;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SectionTitle(title: 'My Cource'),
//         const SizedBox(height: 10),
//         SizedBox(
//           height: 230,
//           child: ListView.builder(
//             shrinkWrap: true,
//             itemCount: joinedCources.length,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (_, i) {
//               return CourceItem(
//                 cource: joinedCources[i],
//                 widthFactor: 2,
//               );
//             },
//           ),
//         )
//       ],
//     );
//   }
// }

class AllCources extends StatelessWidget {
  const AllCources({Key? key, required this.allCources}) : super(key: key);
  final List<CourceModel> allCources;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          SectionTitle(title: 'All Cources'),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: allCources.length,
              itemBuilder: (_, i) {
                return CourceItem(
                  cource: allCources[i],
                  widthFactor: 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.headline4,
        children: <TextSpan>[
          TextSpan(
            text: 'Hi ,',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ' Purushottam \n',
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 40),
          ),
          TextSpan(
            text: 'Welcome to ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ' IDP\n',
            style: TextStyle(color: Colors.redAccent, fontSize: 40),
          ),
        ],
      ),
    );
  }
}
