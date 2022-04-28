import 'package:digital_marketing/main.dart';
import 'package:digital_marketing/screen/onboarding/onboard_data.dart';
import 'package:digital_marketing/screen/onboarding/size_config.dart';
import 'package:digital_marketing/screen/onboarding/widgets/app_styles.dart';
import 'package:digital_marketing/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/my_text_button.dart';
import 'widgets/onboard_nav_button.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      duration: const Duration(milliseconds: 400),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Future setSeenonboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
    // this will set seenOnboard to true when running onboard page for first time.
  }

  @override
  void initState() {
    super.initState();
    setSeenonboard();
  }

  @override
  Widget build(BuildContext context) {
    // initialize size config
    SizeConfig().init(context);
    double sizeV = SizeConfig.blockSizeV!;
    // double sizeV = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 9,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onboardingContents.length,
              itemBuilder: (context, index) => Column(
                children: [
                  SizedBox(
                    height: sizeV * 5,
                  ),
                  Text(
                    onboardingContents[index].title,
                    style: kTitle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: sizeV * 5,
                  ),
                  Container(
                    height: sizeV * 50,
                    child: Image.asset(
                      onboardingContents[index].image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: sizeV * 5,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: kBodyText1,
                      children: [
                        TextSpan(text: 'WE CAN '),
                        TextSpan(
                          text: 'HELP YOU ',
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                        TextSpan(text: 'TO BE A BETTER '),
                        TextSpan(text: 'VERSION OF '),
                        TextSpan(
                          text: 'YOURSELF ',
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sizeV * 5,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  currentPage == onboardingContents.length - 1
                      ? Expanded(
                          child: MyTextButton(
                            buttonName: 'Get Started',
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, WelcomePage.routeName);
                            },
                            bgColor: kPrimaryColor,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OnBoardNavBtn(
                              name: 'Skip',
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, WelcomePage.routeName);
                              },
                            ),
                            Row(
                              children: List.generate(
                                onboardingContents.length,
                                (index) => dotIndicator(index),
                              ),
                            ),
                            OnBoardNavBtn(
                              name: 'Next',
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              },
                            )
                          ],
                        ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
