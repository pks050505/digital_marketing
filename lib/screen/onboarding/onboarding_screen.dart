import 'package:digital_marketing/screen/home_page.dart';
import 'package:digital_marketing/screen/welcomePage/welcome_page_for_login_and_home.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

var imageUrll =
    'https://thumbs.dreamstime.com/b/environment-earth-day-hands-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-nature-field-gra-130247647.jpg';
var secondPic =
    'https://thumbs.dreamstime.com/z/beautiful-summer-spring-meadow-blue-flowers-forget-me-nots-two-flying-butterflies-wild-nature-landscape-beautiful-182636005.jpg';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';
  const OnBoardingScreen({Key? key}) : super(key: key);
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const OnBoardingScreen(),
    );
  }

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var size;
  var listPagesViewModel = [
    PageViewModel(
      bodyWidget: Container(
        color: Colors.amber,
        child: const Text('data'),
      ),
      titleWidget: const Text('Title'),
    ),
    PageViewModel(
      title: "Title of second page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Image.network(
        imageUrll,
        height: double.infinity,
        width: double.infinity,
      ),
    ),
    PageViewModel(
      title: "Title of third page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(
        child: Image.network(imageUrll, height: 175.0),
      ),
    ),
    PageViewModel(
      title: "Title of forth page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(
        child: Image.network(
          secondPic,
          fit: BoxFit.cover,
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return IntroductionScreen(
      pages: listPagesViewModel,
      onDone: () {
        Navigator.pushReplacementNamed(
            context, WelcomePageForLoginAndHome.routeName);
      },
      // onSkip: () {
      //   Navigator.pushReplacementNamed(context, HomePage.routeName);
      // },
      showBackButton: false,
      showSkipButton: true,
      skip: Text('Skip'),
      next: const Text('Next'),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).primaryColor,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}
