import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmerEffectUI extends StatelessWidget {
  final double width, height;
  final ShapeBorder shapeBorder;
  MyShimmerEffectUI.rectangular({
    this.width = double.infinity,
    required this.height,
  }) : shapeBorder = const RoundedRectangleBorder();
  const MyShimmerEffectUI.circular({
    this.width = double.infinity,
    required this.height,
  }) : shapeBorder = const CircleBorder();
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey,
      period: Duration(seconds: 3),
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Colors.grey,
          shape: shapeBorder,
        ),
      ),
    );
  }
}
