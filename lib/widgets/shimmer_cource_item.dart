import 'package:digital_marketing/core/constants.dart';
import 'package:digital_marketing/widgets/shimmer_effect_ui.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../demo_shimmer.dart';

class ShimmerCourceItem extends StatelessWidget {
  const ShimmerCourceItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Shimmer(
      gradient: shimmerGradient,
      child: Card(
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: MyShimmerEffectUI.rectangular(
                height: 100,
                width: width / 2,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: MyShimmerEffectUI.rectangular(
                height: 16,
                width: width / 3,
              ),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: MyShimmerEffectUI.rectangular(
                height: 10,
                width: width / 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
