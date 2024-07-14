import 'package:flutter/material.dart';

import '../../../reusables/colors.dart';
import '../../../models/climate_model.dart';
import '../../../reusables/sized_box_hw.dart';
import '../../../reusables/styles.dart';
import 'weather_icons.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherCard({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: haderText(),
          ),
          Text(
            "${weatherModel.temp.toStringAsFixed(1)}°C",
            style: largeHeader(),
          ),
          Text(
            "Max: ${weatherModel.tempMax.toStringAsFixed(1)}°C    Min: ${weatherModel.tempMin.toStringAsFixed(1)}°C",
            style: smallTextWhite(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                getWeatherIcon(weatherModel.weatherMain),
                color: white,
                size: 30,
              ),
              sw20,
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  weatherModel.weatherMain,
                  style: const TextStyle(
                    color: white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
