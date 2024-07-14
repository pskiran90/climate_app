import 'package:flutter/material.dart';

import '../../reusables/navigators.dart';
import '../../constants/app_constants.dart';
import '../../reusables/colors.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        pushByReplacing(context, const OnboardingScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: primaryGradient,
        ),
        width: screenWidth,
        child: Center(
          child: Image.asset(
            AppConstants.appLogo,
          ),
        ),
      ),
    );
  }
}
