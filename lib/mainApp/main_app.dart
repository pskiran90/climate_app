import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/fetchBlocs/fetch_city_climate_bloc.dart';
import 'screens/dashboard/dashboard.dart';
import 'reusables/colors.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentIndex = 0;

  @override
  void initState() {
    context.read<FetchWeatherBloc>().add(FetchWeather());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: DashboardScreen(),
        ),
      ),
    );
  }
}
