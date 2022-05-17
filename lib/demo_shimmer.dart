import 'package:digital_marketing/dao/models.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// class DemoShimmer extends StatefulWidget {
//   const DemoShimmer({Key? key}) : super(key: key);

//   @override
//   State<DemoShimmer> createState() => _DemoShimmerState();
// }

// class _DemoShimmerState extends State<DemoShimmer> {
//   InstructorRepository repository = InstructorRepository();
//   List<InstructorModel>? instructors = [];
//   bool isLoading = false;
//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }

//   Future loadData() async {
//     setState(() {
//       isLoading = true;
//     });
//     await Future.delayed(Duration(seconds: 5));
//     instructors = await repository.getAllInstructors();
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Shimmer Effect ListView demo'),
//       ),
//       body: ListView.builder(
//         itemCount: isLoading ? 4 : instructors!.length,
//         itemBuilder: (context, i) {
//           if (isLoading) {
//             return shimmerEffetUiWidget(context);
//           } else {
//             final instructor = instructors![i];
//             return listViewUi(instructor);
//           }
//         },
//       ),
//     );
//   }
// }



// Widget listViewUi(InstructorModel instructor) {
//   return ListTile(
//     leading: CircleAvatar(
//       radius: 25,
//       backgroundImage: NetworkImage(instructor.instructorPic),
//     ),
//     title: Text(instructor.name),
//   );
// }

// Widget shimmerEffetUiWidget(BuildContext context) {
//   return ListTile(
//     leading: const MyShimmerEffectUI.circular(
//       height: 60,
//       width: 60,
//     ),
//     title: Align(
//       alignment: Alignment.centerLeft,
//       child: MyShimmerEffectUI.rectangular(
//         height: 18,
//         width: MediaQuery.of(context).size.width * 0.35,
//       ),
//     ),
//   );
// }
