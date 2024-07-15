import 'package:flutter/material.dart';

import 'reusables/colors.dart';
import 'screens/dashboard/weatherDashboard/weather_dashboard.dart';

//incase there is more blocs this will be the entryponit
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: WeatherDashboardScreen(),
      ),
    );
  }
}
