import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mainApp/bloc/fetchBlocs/fetch_city_climate_bloc.dart';
import 'mainApp/constants/app_constants.dart';
import 'mainApp/screens/splashScreen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FetchWeatherBloc()),
      ],
      child: MaterialApp(
        title: AppConstants.appTitle,
        theme: ThemeData(fontFamily: 'UniformRounded'),
        home: const SplashScreen(),
      ),
    );
  }
}
