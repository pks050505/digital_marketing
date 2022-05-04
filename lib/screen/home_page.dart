import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_marketing/bloc/theme/theme_cubit.dart';
import 'package:digital_marketing/dao/models.dart';

import 'package:digital_marketing/screen/search_page.dart';
import 'package:digital_marketing/service/cource_service.dart';
import 'package:digital_marketing/widgets/cource_item.dart';

import 'package:digital_marketing/widgets/instructor_item.dart';
import 'package:digital_marketing/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String imageUrll =
    'https://images.ctfassets.net/hrltx12pl8hq/a2hkMAaruSQ8haQZ4rBL9/8ff4a6f289b9ca3f4e6474f29793a74a/nature-image-for-website.jpg?fit=fill&w=480&h=320';
String imagelink =
    'https://media.istockphoto.com/photos/woman-in-red-jacket-is-standing-on-the-coast-of-braies-lake-at-in-picture-id1128740636?s=612x612';

class HomePage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final CourceService courceService = CourceServiceImpl();

    return Scaffold(
      appBar: AppBar(
        title: const Text('I DIGITAL PRENEUR'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              // context.read<ThemeCubit>().changeTheme();
            },
            icon: const Icon(Icons.abc),
          ),
        ],
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
                height: 160,
                onPageChanged: (i, reson) {},
                aspectRatio: 16 / 9,
                viewportFraction: 0.9,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                // autoPlayInterval: const Duration(seconds: 3),
                // autoPlayAnimationDuration: const Duration(microseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),
//const TrendingCourceWidget(),

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
                // Navigator.pushNamed(context, AllCoursePage.routeName);
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return SearchPage();
                }));
              },
              child: Icon(
                Icons.search,
                size: 25,
                color: Colors.black,
              ),
            )
          ],
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: CourceModel.cources.length,
            itemBuilder: (_, i) {
              // return ColoredBox(
              //   color: Colors.green,
              //   child: CourceItemTest(),
              // );
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
