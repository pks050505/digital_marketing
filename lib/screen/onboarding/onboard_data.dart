class OnBoarding {
  final String title;
  final String image;

  OnBoarding({
    required this.title,
    required this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Welcome to\n Monumental habits',
    image: 'asserts/images/onboarding_image_1.png',
  ),
  OnBoarding(
    title: 'Create new habits easily',
    image: 'asserts/images/onboarding_image_2.png',
  ),
  OnBoarding(
    title: 'Keep track of your progress',
    image: 'asserts/images/onboarding_image_3.png',
  ),
  OnBoarding(
    title: 'Join a supportive community',
    image: 'asserts/images/onboarding_image_4.png',
  ),
];
//asserts/loading.gif