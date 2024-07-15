import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/fetchBlocs/fetch_city_climate_bloc.dart';
import '../../../constants/app_constants.dart';
import '../../../models/climate_model.dart';
import '../../../reusables/colors.dart';
import '../../../reusables/loader.dart';
import '../../../reusables/not_enough_data.dart';
import '../../../reusables/sized_box_hw.dart';
import '../../../reusables/snackbar.dart';
import '../../../reusables/styles.dart';
import 'weather_screen_widgets.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //bloc to manage state of weatherdata
    return BlocProvider(
      create: (context) => FetchWeatherBloc()..add(FetchWeather()),
      child: BlocConsumer<FetchWeatherBloc, FetchWeatherState>(
        listener: (context, state) {
          if (state is FetchWeatherSuccess) {
            showSnackBar(
              context,
              "Fetched weather data successfully",
              error: false,
            );
          } else if (state is FetchWeatherFailure) {
            showSnackBar(
              context,
              "Please search a valid city",
              error: true,
            );
          }
        },
        builder: (context, state) {
          if (state is FetchWeatherSuccess) {
            return Scaffold(
              body: SafeArea(
                child: WeatherBody(weatherModel: state.climates),
              ),
            );
          } else if (state is FetchWeatherFailure) {
            return const NoData();
          } else {
            return const LoaderScaffold(
              msg: "Fetching weather data...",
            );
          }
        },
      ),
    );
  }
}

class WeatherBody extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherBody({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height,
      decoration: const BoxDecoration(gradient: primaryGradient),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sh40,
              Image.asset(AppConstants.appLogo),
              SizedBox(
                height: size.height * 0.4,
                width: size.width,
                child: WeatherCard(
                  weatherModel: weatherModel,
                ),
              ),
              sh20,
              SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                      width: size.width * 0.45,
                      child: Card(
                        color: primaryColor,
                        child: Center(
                          child: Text(
                            "Humidity: ${weatherModel.humidity}%",
                            style: smallTextWhite(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                      width: size.width * 0.45,
                      child: Card(
                        color: primaryColor,
                        child: Center(
                          child: Text(
                            "Wind Speed: ${weatherModel.windSpeed.toStringAsFixed(1)} m/s",
                            style: smallTextWhite(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
