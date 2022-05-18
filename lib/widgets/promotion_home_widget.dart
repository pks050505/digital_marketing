import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../screen/home_page.dart';

class PromotionHomeWidget extends StatelessWidget {
  const PromotionHomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 7),
        CarouselSlider(
          items: List.generate(
            6,
            (index) => Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    imageUrll,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          options: CarouselOptions(
            height: 170,
            viewportFraction: 0.9,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(
              seconds: 5,
            ),
            autoPlayAnimationDuration: const Duration(seconds: 4),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
