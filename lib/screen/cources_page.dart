import 'package:digital_marketing/dao/cource_model.dart';
import 'package:digital_marketing/widgets/cource_item.dart';
import 'package:digital_marketing/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cource/cource_bloc.dart';

class CourcesPage extends StatelessWidget {
  static const routeName = '/course_page';
  const CourcesPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CourcesPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Cources"),
        centerTitle: true,
        //some error found need to fix
        automaticallyImplyLeading: false,
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(50),
        //   child: Text(
        //     "Learn the art of self empowerment ,\n don’t delay enrol now in our courses\n and move a step closer towards Aatmanirbharta.",
        //   ),
        // ),
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.landscape) {
              return Row(
                children: [
                  FeatureText(),
                  const Expanded(
                    child: Buildtilelistview(),
                  )
                ],
              );
            }
            return Column(
              children: [
                // Card(
                //   margin: const EdgeInsets.all(10),
                //   color: Colors.red.shade100,
                //   child: const Flexible(
                //       child: Padding(
                //     padding: EdgeInsets.all(8.0),
                //     child: Text(
                //       "Learn the art of self empowerment , don’t delay enrol now in our courses and move a step closer towards Aatmanirbharta.",
                //       style: TextStyle(fontSize: 18),
                //     ),
                //   )),
                // ),
                // FeatureText(),
                const Buildtilelistview(),
              ],
            );
          },
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

class Buildtilelistview extends StatelessWidget {
  const Buildtilelistview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourceBloc, CourceState>(
      builder: (context, state) {
        if (state is CourceLoadedState) {
          return OrientationBuilder(builder: (context, orientation) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: state.cources.length,
              itemBuilder: (_, i) {
                return CourceItem(
                  widthFactor: 1,
                  cource: state.cources[i],
                );
              },
            );
          });
        }
        return CircularProgressIndicator();
      },
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
          const SectionTitle(title: 'All Cources'),
          const SizedBox(height: 10),
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
        style: Theme.of(context).textTheme.headline5,
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
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 25),
          ),
          TextSpan(
            text: 'Welcome to ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ' IDP\n',
            style: TextStyle(color: Colors.redAccent, fontSize: 25),
          ),
        ],
      ),
    );
  }
}
