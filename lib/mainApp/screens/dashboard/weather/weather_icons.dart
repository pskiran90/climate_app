import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

IconData getWeatherIcon(String weatherMain) {
  switch (weatherMain) {
    case 'Clear':
      return WeatherIcons.day_sunny;
    case 'Clouds':
      return WeatherIcons.cloud;
    case 'Rain':
      return WeatherIcons.rain;
    case 'Snow':
      return WeatherIcons.snow;
    case 'Thunderstorm':
      return WeatherIcons.thunderstorm;
    case 'Drizzle':
      return WeatherIcons.sprinkle;
    case 'Atmosphere':
      return WeatherIcons.fog;
    case 'Haze':
      return WeatherIcons.day_haze;
    case 'Mist':
      return WeatherIcons.raindrops;
    case 'Fog':
      return WeatherIcons.fog;
    case 'Smoke':
      return WeatherIcons.smoke;
    case 'Dust':
      return WeatherIcons.dust;
    case 'Sand':
      return WeatherIcons.sandstorm;
    case 'Ash':
      return WeatherIcons.volcano;
    case 'Squall':
      return WeatherIcons.strong_wind;
    case 'Tornado':
      return WeatherIcons.tornado;
    default:
      return WeatherIcons.cloud;
  }
}
