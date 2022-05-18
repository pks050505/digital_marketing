import 'package:digital_marketing/screen/search_page.dart';
import 'package:digital_marketing/service/cource_service.dart';

import 'package:flutter/material.dart';

import '../widgets/allcource_home_widget.dart';
import '../widgets/promotion_home_widget.dart';
import '../widgets/trending_home_widget.dart';

String imageUrll =
    'https://images.ctfassets.net/hrltx12pl8hq/a2hkMAaruSQ8haQZ4rBL9/8ff4a6f289b9ca3f4e6474f29793a74a/nature-image-for-website.jpg?fit=fill&w=480&h=320';
String imagelink =
    'https://media.istockphoto.com/photos/woman-in-red-jacket-is-standing-on-the-coast-of-braies-lake-at-in-picture-id1128740636?s=612x612';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) {
        return const HomePage();
      },
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final CourceService courceService = CourceServiceImpl();
    // void popUpOnselected(BuildContext context,AppMenu appMenu){
    //    ( result) {

    //         }
    // }

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'asserts/images/idplogo.png',
          height: 30,
          color: Colors.lightGreen,
        ),
        title: const Text('I DIGITAL PRENEUR'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.routeName);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            PromotionHomeWidget(),
            TrendingWidget(),
            AllCourcesWidget(),
          ],
        ),
      ),
    );
  }
}


    // late List<CourceModel> cources;
    // bool isLoading = false;
    // return Column(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     const SectionTitle(title: 'All Courses'),
    //     BlocBuilder<AllCourceBloc, AllCourceState>(
    //       builder: (context, state) {
    //         if (state is AllCourceLoading) {
    //           isLoading = true;
    //         } else if (state is AllCourceLoaded) {
    //           isLoading = false;
    //           cources = state.cources;
    //         }
    //         return ListView.builder(
    //           shrinkWrap: true,
    //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //           physics: const BouncingScrollPhysics(),
    //           scrollDirection: Axis.horizontal,
    //           itemCount: isLoading ? 1 : cources.length,
    //           itemBuilder: (_, i) {
    //             if (isLoading) {
    //               return const Center(child: CircularProgressIndicator());
    //             } else {
    //               return SizedBox(
    //                 height: 350,
    //                 child: CourceNewCard(
    //                   cource: cources[i],
    //                 ),
    //               );
    //             }
    //           },
    //         );
    //       },
    //     )
    //   ],
    // );
 

// class TrendingCourceWidget extends StatelessWidget {
//   const TrendingCourceWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     late List<CourceModel> cources;
//     bool isLoading = false;
//     return Column(
//       children: [
//         const SectionTitle(title: 'Most Trending Courses'),
//         BlocBuilder<TrendincourceBloc, TrendincourceState>(
//           builder: (context, state) {
//             if (state is TrendincourceLoading) {
//               isLoading = true;
//             } else if (state is TrendingcourceLoaded) {
//               isLoading = false;
//               cources = state.cources;
//             }
//             return SizedBox(
//               height: 200,
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 physics: const BouncingScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 itemCount: isLoading ? 4 : cources.length,
//                 itemBuilder: (_, i) {
// // if (isLoading) {
// //             return shimmerEffetUiWidget(context);
// //           } else {
// //             final instructor = instructors![i];
// //             return listViewUi(instructor);
// //           }
//                   if (isLoading) {
//                     return const ShimmerCourceItem();
//                   } else {
//                     final cource = cources[i];
//                     return _uiWidget(cource);
//                   }
//                 },
//               ),
//             );
//           },
//         )
//       ],
//     );
//   }
// }

// Widget _uiWidget(CourceModel cource) {
//   return CourceItem(cource: cource, widthFactor: 2);
// }

// Widget _shimmerEffectUiWidget(
//     {required double widthFactor, required BuildContext context}) {
//   var width = MediaQuery.of(context).size.width / widthFactor;
//   return Column(
//     children: [
//       MyShimmerEffectUI.rectangular(
//         height: 100,
//         width: width,
//       ),
//       SizedBox(
//         height: 5,
//       ),
//       MyShimmerEffectUI.rectangular(
//         height: 10,
//         width: width,
//       ),
//     ],
//   );
// }

// class InstructorCorouselSlider extends StatelessWidget {
//   const InstructorCorouselSlider({Key? key, required this.instructors})
//       : super(key: key);
//   final List<InstructorModel> instructors;
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<InstructorBloc, InstructorState>(
//       builder: (context, state) {
//         List<InstructorModel> instructors = [];
//         bool isLoading = false;
//         if (state is InstructorLoadingState) {
//           isLoading = true;
//         }
//         if (state is InstructorLoadedState) {
//           isLoading = false;
//           instructors = state.instructors;
//         }
//         if (state is InstructorErrorState) {
//           return Center(
//             child: Text(
//               state.message,
//               style: TextStyle(color: Colors.red, fontSize: 40),
//             ),
//           );
//         }

//         return InstructorList(
//           isLoading: isLoading,
//           instructors: instructors,
//         );
//       },
//     );
//   }
// }

// class InstructorList extends StatelessWidget {
//   const InstructorList({
//     Key? key,
//     required this.instructors,
//     required this.isLoading,
//   }) : super(key: key);
//   final bool isLoading;
//   final List<InstructorModel> instructors;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Align(
//           alignment: Alignment.topLeft,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 SectionTitle(title: 'Instructor'),
//                 SectionSubTitle(title: 'The IDP Experts & Instructors')
//               ],
//             ),
//           ),
//         ),
//         ShimmerLoading(
//           isLoading: isLoading,
//           child: CarouselSlider(
//             items: List.generate(
//               instructors.length,
//               (index) => ShimmerLoading(
//                 isLoading: isLoading,
//                 child: InstructorItem(instructor: instructors[index]),
//               ),
//             ),
//             options: CarouselOptions(
//               height: 300,
//               aspectRatio: 16 / 9,
//               viewportFraction: 0.8,
//               initialPage: 0,
//               enableInfiniteScroll: true,
//               reverse: false,
//               autoPlay: true,
//               autoPlayInterval: const Duration(seconds: 3),
//               autoPlayAnimationDuration: const Duration(milliseconds: 800),
//               autoPlayCurve: Curves.fastOutSlowIn,
//               scrollDirection: Axis.horizontal,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class ShimmerLoading extends StatefulWidget {
//   const ShimmerLoading({
//     Key? key,
//     required this.isLoading,
//     required this.child,
//   }) : super(key: key);
//   final bool isLoading;
//   final Widget child;
//   @override
//   State<ShimmerLoading> createState() => _ShimmerLoadingState();
// }

// class _ShimmerLoadingState extends State<ShimmerLoading> {
//   @override
//   Widget build(BuildContext context) {
//     if (!widget.isLoading) {
//       return widget.child;
//     }
//     return ShaderMask(
//       blendMode: BlendMode.srcATop,
//       shaderCallback: (bounds) {
//         return shimmerGradient.createShader(bounds);
//       },
//       child: widget.child,
//     );
//   }
// }
