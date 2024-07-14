import 'package:climate_app/mainApp/constants/app_constants.dart';
import 'package:climate_app/mainApp/reusables/styles.dart';
import 'package:flutter/material.dart';
import '../../../models/climate_model.dart';
import '../../../reusables/colors.dart';
import '../../../reusables/sized_box_hw.dart';
import 'weather_screen_widgets.dart';

class WeatherScreen extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherScreen({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(gradient: primaryGradient),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sh40,
                Image.asset(AppConstants.appLogo),
                SizedBox(
                  height: size.height * 0.3,
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
      ),
    );
  }
}
