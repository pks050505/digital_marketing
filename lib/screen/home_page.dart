import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_marketing/dao/cource_model.dart';
import 'package:digital_marketing/dao/models.dart';

import 'package:digital_marketing/extra_screen/cource_detail_page.dart';
import 'package:digital_marketing/test_page.dart';
import 'package:digital_marketing/widgets/cource_item.dart';
import 'package:digital_marketing/widgets/custom_appbar.dart';
import 'package:digital_marketing/widgets/custom_bottom_nav_bar.dart';
import 'package:digital_marketing/widgets/custom_drawer.dart';
import 'package:digital_marketing/widgets/instructor_item.dart';
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
    var index = 0;
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: new Text('Yes'),
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: CustomAppBar(),
        ),
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              // Container(
              //   height: 150,
              //   margin: const EdgeInsets.symmetric(vertical: 15),
              //   child: FeatureText(),
              // ),
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
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
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
                  onPageChanged: (i, reson) {
                    print('index $i');
                    index = i;
                  },
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
        bottomNavigationBar: CustomNavBar(),
      ),
    );
  }
}

class TrendingCourceWidget extends StatelessWidget {
  const TrendingCourceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      child: Column(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Most Trending Courses ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Container(
          height: 340,
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: CourceModel.cources.length,
            itemBuilder: (_, i) {
              return CourceCardTest(cource: CourceModel.cources[i]);
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
      ]),
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
                Text(
                  'Instructor',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'The IDP Experts & Instructors',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
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
