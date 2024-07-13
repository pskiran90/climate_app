import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../constants/app_constants.dart';
import '../dashboard/dashboard.dart';

import '../../reusables/colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntroductionScreen(
        globalBackgroundColor: primaryColor,
        pages: [
          PageViewModel(
            title: 'Welcome to WeatherPulse',
            body: 'Your personal weather companion.',
            image: buildImage(AppConstants.weatherImg1),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Get real-time weather updates and alerts',
            body: 'Stay informed about air quality in your area',
            image: buildImage(AppConstants.weatherImg2),
            decoration: getPageDecoration(),
          ),
        ],
        done: const Text(
          'Continue',
          style: TextStyle(color: white, fontSize: 12),
        ),
        onDone: (() {
          navigatToDashboard(context);
        }),
        showSkipButton: true,
        skip: const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Skip',
            style: TextStyle(color: white),
          ),
        ),
        onSkip: (() {
          navigatToDashboard(context);
        }),
        next: const Text(
          "Next",
          style: TextStyle(color: white),
        ),
        dotsFlex: 2,
        dotsDecorator: getDotDecoration(),
      ),
    );
  }

  void navigatToDashboard(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        ),
      );

  Widget buildImage(String path) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                path,
                height: 260,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ],
      );
  // decotare dote for onboarding
  DotsDecorator getDotDecoration() => DotsDecorator(
        color: grey,
        activeColor: white,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );
  // decorations for onboarding
  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: primaryColor),
        bodyTextStyle: TextStyle(fontSize: 16),
        imagePadding: EdgeInsets.all(24),
        pageColor: white,
      );
  PageDecoration introPageDecoration() => const PageDecoration(
        boxDecoration: BoxDecoration(color: primaryColor),
        titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: white),
        bodyTextStyle: TextStyle(color: white),
        imagePadding: EdgeInsets.all(24),
      );
}
