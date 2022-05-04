import 'package:flutter/material.dart';

import '../dao/cource_model.dart';
import '../widgets/cource_item.dart';

List<String> options = [
  'Finance',
  'Education',
  'Video Editing',
  'Trading',
  'Education',
  'Video Editing',
  'Trading',
  'Finance',
  'Education',
  'Video Editing',
  'Trading',
  'Education',
  'Video Editing',
  'Trading'
];

class AllCoursePage extends StatelessWidget {
  static const routeName = 'allcourcepage';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const AllCoursePage(),
    );
  }

  const AllCoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Category')),
      body: Column(
        children: [
          GridView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: CourceModel.cources.length,
            itemBuilder: (_, i) {
              return CourceItem(
                widthFactor: 1,
                cource: CourceModel.cources[i],
              );
            },
          ),
        ],
      ),
    );
  }
}

// class ChipWidget extends StatefulWidget {
//   const ChipWidget({Key? key}) : super(key: key);

//   @override
//   State<ChipWidget> createState() => _ChipWidgetState();
// }

// class _ChipWidgetState extends State<ChipWidget> {
 
//   var _value;
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       children: List<Widget>.generate(
//         options.length,
//         (int idx) {
//           return Container(
//             margin: const EdgeInsets.symmetric(horizontal: 5),
//             child: ChoiceChip(
//                 materialTapTargetSize: MaterialTapTargetSize.padded,
//                 elevation: 5,
//                 label: Text(options[idx]),
//                 selected: _value == idx,
//                 selectedColor: Theme.of(context).primaryColor,
//                 onSelected: (bool selected) {
//                   setState(() {
//                     _value = selected ? idx : null;
//                   });
//                 }),
//           );
//         },
//       ).toList(),
//     );
//   }
// }
