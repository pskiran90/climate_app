import 'package:climate_app/mainApp/reusables/navigators.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../constants/app_constants.dart';
import '../../main_app.dart';
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
          pushSimple(context, const MainApp());
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
          pushSimple(context, const MainApp());
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

  Widget buildImage(String path) => Center(
        child: Image.asset(
          path,
          height: 260,
          fit: BoxFit.contain,
        ),
      );

  // Decorate dots for onboarding
  DotsDecorator getDotDecoration() => DotsDecorator(
        color: grey,
        activeColor: white,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  // Decorations for onboarding
  PageDecoration getPageDecoration() => const PageDecoration(
        imageFlex: 4,
        bodyFlex: 1,
        imageAlignment: Alignment.bottomCenter,
        bodyAlignment: Alignment.topCenter,
        titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: white),
        bodyTextStyle: TextStyle(fontSize: 16, color: white),
        imagePadding: EdgeInsets.only(top: 24),
        pageColor: primaryColor,
      );
}
