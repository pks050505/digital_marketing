import 'package:carousel_slider/carousel_slider.dart';

import 'package:digital_marketing/dao/models.dart';

import 'package:digital_marketing/screen/onboarding/onboarding_screen.dart';
import 'package:digital_marketing/service/cource_service.dart';
import 'package:digital_marketing/test_page.dart';
import 'package:digital_marketing/widgets/cource_item.dart';

import 'package:digital_marketing/widgets/instructor_item.dart';
import 'package:digital_marketing/widgets/section_title.dart';
import 'package:flutter/material.dart';

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

    // Future<bool> _onWillPop() async {
    //   return (await showDialog(
    //         context: context,
    //         builder: (context) => new AlertDialog(
    //           title: new Text('Are you sure?'),
    //           content: new Text('Do you want to exit an App'),
    //           actions: <Widget>[
    //             TextButton(
    //               onPressed: () => Navigator.of(context).pop(false),
    //               child: new Text('No'),
    //             ),
    //             TextButton(
    //               onPressed: () => Navigator.of(context).pop(true),
    //               child: new Text('Yes'),
    //             ),
    //           ],
    //         ),
    //       )) ??
    //       false;
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('I DIGITAL PRENEUR'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                    Container(
                      color: Colors.amber,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'featured Post',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text('index $index'),
                    )
                  ],
                ),
              ),
              options: CarouselOptions(
                height: 220,
                onPageChanged: (i, reson) {},
                aspectRatio: 16 / 9,
                viewportFraction: 0.9,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),
            TrendingCourceWidget(),
            SizedBox(height: 20),
            // CourcePackageType(),
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

class TrendingCourceWidget extends StatelessWidget {
  const TrendingCourceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Align(
        //   alignment: Alignment.topLeft,
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Text(
        //       'Most Trending Courses ',
        //       style: TextStyle(
        //           fontSize: 18,
        //           fontWeight: FontWeight.bold,
        //           color: Theme.of(context).primaryColor),
        //       textAlign: TextAlign.left,
        //     ),
        //   ),
        // ),
        const SectionTitle(title: 'Most Trending Cources'),
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
        // Container(
        //   height: 150,
        //   child: ListView.builder(
        //     shrinkWrap: true,
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (_, i) {
        //       return Container(
        //         margin: const EdgeInsets.all(5),
        //         height: 130,
        //         color: Colors.amber,
        //         width: 100,
        //         child: Center(child: Text('item $i')),
        //       );
        //     },
        //   ),
        // )
      ],
    );
  }
}

class FeatureText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.headline4,
        children: <TextSpan>[
          TextSpan(
            text: 'Study & Learn',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ' New \nSkills',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          TextSpan(
            text: ' Everyday ,',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
              text: "\n Learning Never Exhausts Mind.",
              style: Theme.of(context).textTheme.bodyText1)
        ],
      ),
    );
  }
}

class CourcePackageType extends StatelessWidget {
  const CourcePackageType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'IDigitalPreneur Packages',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Container(
          height: 250,
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (_, i) {
              return Container(
                margin: const EdgeInsets.all(5),
                height: 130,
                width: 150,
                color: Colors.amber,
                child: Center(child: Text('item ${i + 1}')),
              );
            },
          ),
        )
      ]),
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
                // Text(
                //   'The IDP Experts & Instructors',
                //   style: TextStyle(
                //     fontSize: 16,
                //   ),
                //   textAlign: TextAlign.left,
                // ),
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

class FeaturedCorouselSlider extends StatelessWidget {
  const FeaturedCorouselSlider({Key? key, required this.instructors})
      : super(key: key);
  final List<InstructorModel> instructors;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: List.generate(
            instructors.length,
            (index) => Image.network(imageUrll),
          ),
          options: CarouselOptions(
            height: 300,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
