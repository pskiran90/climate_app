class WeatherModel {
  final String cityName;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final String weatherMain;
  final String weatherDescription;
  final String weatherIcon;

  WeatherModel({
    required this.cityName,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.weatherMain,
    required this.weatherDescription,
    required this.weatherIcon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    const kelvinToCelsius = 273.15;
    return WeatherModel(
      cityName: json['name'],
      temp: (json['main']['temp'] as num).toDouble() - kelvinToCelsius,
      feelsLike: (json['main']['feels_like'] as num).toDouble() - kelvinToCelsius,
      tempMin: (json['main']['temp_min'] as num).toDouble() - kelvinToCelsius,
      tempMax: (json['main']['temp_max'] as num).toDouble() - kelvinToCelsius,
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      weatherMain: json['weather'][0]['main'],
      weatherDescription: json['weather'][0]['description'],
      weatherIcon: json['weather'][0]['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    const kelvinToCelsius = 273.15;
    return {
      'cityName': cityName,
      'temp': temp + kelvinToCelsius,
      'feels_like': feelsLike + kelvinToCelsius,
      'temp_min': tempMin + kelvinToCelsius,
      'temp_max': tempMax + kelvinToCelsius,
      'pressure': pressure,
      'humidity': humidity,
      'wind_speed': windSpeed,
      'weather_main': weatherMain,
      'weather_description': weatherDescription,
      'weather_icon': weatherIcon,
    };
  }
}
