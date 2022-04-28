import 'package:carousel_slider/carousel_slider.dart';

import 'package:digital_marketing/dao/models.dart';
import 'package:digital_marketing/screen/all_course_page.dart';

import 'package:digital_marketing/service/cource_service.dart';

import 'package:digital_marketing/widgets/cource_item.dart';

import 'package:digital_marketing/widgets/instructor_item.dart';
import 'package:digital_marketing/widgets/section_title.dart';
import 'package:flutter/material.dart';

String imageUrll =
    'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__480.jpg';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) {
        return const HomePage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final CourceService courceService = CourceServiceImpl();

    return Scaffold(
      appBar: AppBar(
        title: const Text('I DIGITAL PRENEUR'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Container(
            //   height: 150,
            //   margin: const EdgeInsets.symmetric(vertical: 15),
            //   child: FeatureText(),
            // ),
            // FeaturedCorouselSlider(instructors: instructors),
            CarouselSlider(
              items: List.generate(
                6,
                (index) => Stack(
                  children: [
                    Image.network(
                      imageUrll,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
              options: CarouselOptions(
                height: 200,
                onPageChanged: (i, reson) {},
                aspectRatio: 16 / 9,
                viewportFraction: 0.9,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(microseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),
            TrendingCourceWidget(),

            // CourcePackageType(),
            const AllCourcesWidget(),
            InstructorCorouselSlider(
              instructors: InstructorModel.instructors,
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CustomNavBar(),
    );
  }
}

class AllCourcesWidget extends StatelessWidget {
  const AllCourcesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SectionTitle(title: 'All Courses'),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AllCoursePage.routeName);
              },
              child: const Text('show All'),
            )
          ],
        ),
        Container(
          height: 240,
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: CourceModel.cources.length,
            itemBuilder: (_, i) {
              return CourceItem(
                cource: CourceModel.cources[i],
                widthFactor: 2,
              );
            },
          ),
        )
      ],
    );
  }
}

class TrendingCourceWidget extends StatelessWidget {
  const TrendingCourceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SectionTitle(title: 'Most Trending Courses'),
        Container(
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: CourceModel.cources.length,
            itemBuilder: (_, i) {
              return CourceItem(
                cource: CourceModel.cources[i],
                widthFactor: 2,
              );
            },
          ),
        )
      ],
    );
  }
}

class InstructorCorouselSlider extends StatelessWidget {
  const InstructorCorouselSlider({Key? key, required this.instructors})
      : super(key: key);
  final List<InstructorModel> instructors;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(title: 'Instructor'),
                SectionSubTitle(title: 'The IDP Experts & Instructors')
              ],
            ),
          ),
        ),
        CarouselSlider(
          items: List.generate(
            instructors.length,
            (index) => InstructorItem(instructor: instructors[index]),
          ),
          options: CarouselOptions(
            height: 300,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
