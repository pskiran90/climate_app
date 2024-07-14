import 'package:flutter/material.dart';

import 'reusables/colors.dart';
import 'screens/dashboard/weatherDashboard/dashboard.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: WeatherDashboarScreen(),
      ),
    );
  }
}
