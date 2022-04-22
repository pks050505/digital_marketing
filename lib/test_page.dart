// import 'package:digital_marketing/dao/models.dart';
// import 'package:digital_marketing/extra_screen/cource_detail_page.dart';
// import 'package:digital_marketing/screen/onboarding/onboarding_screen.dart';
// import 'package:flutter/material.dart';

// class TestPage extends StatelessWidget {
//   static const routeName = '/testpage';
//   const TestPage({Key? key}) : super(key: key);
//   static MaterialPageRoute route() {
//     return MaterialPageRoute(
//       settings: const RouteSettings(name: routeName),
//       builder: (_) {
//         return const TestPage();
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Stack(
//         children: [
//           Container(
//               width: MediaQuery.of(context).size.width / 2.5,
//               child: ElevatedButton(
//                 child: const Text('Cource Card Test'),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) {
//                         return Scaffold(
//                           appBar: AppBar(
//                             title: const Text('Cource Card Test'),
//                           ),
//                           body: CourceCardTest(
//                             cource: CourceModel.cources[0],
//                             widthFactor: 1,
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 },
//               )),
//           // Container(
//           //   padding: const EdgeInsets.all(4),
//           //   decoration: BoxDecoration(
//           //     color: Colors.amber,
//           //     borderRadius: BorderRadius.circular(5),
//           //   ),
//           //   child: Text(),
//           // )
//         ],
//       ),
//     );
//   }
// }
