import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../constants/api_endpoint.dart';
import '../../models/climate_model.dart';
import '../../reusables/globals.dart';

class FetchWeatherBloc extends Bloc<FetchWeatherEvent, FetchWeatherState> {
  FetchWeatherBloc() : super(FetchWeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      GlobalNotifier globalNotifier = GlobalNotifier();
      emit(FetchWeatherProgress());
      if (kDebugMode) debugPrint("FetchWeatherBloc started");
      var client = http.Client();
      try {
        log("globalNotifier.cityName.value: ${globalNotifier.cityName.value}");
        var response = await client.get(
          // Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=${globalNotifier.cityName.value}&appid=ed8422949a4ded4ddda4e9a545a7ed3f"),
          Uri.parse("${ApiEndPoint.baseUrl}${globalNotifier.cityName.value}${ApiEndPoint.appId}"),
        );
        if (kDebugMode) log("API response received with status: ${response.statusCode}");
        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          final climateList = WeatherModel.fromJson(jsonResponse);
          log("fetched weather data: ", name: climateList.cityName);
          emit(FetchWeatherSuccess(climates: climateList));
        } else {
          if (kDebugMode) log("API call failed with status: ${response.statusCode}");
          emit(FetchWeatherFailure('Failed to fetch data. Status code: ${response.statusCode}'));
        }
      } catch (e) {
        if (kDebugMode) log("Exception occurred: $e");
        emit(FetchWeatherFailure('Failed to fetch data. Error: $e'));
      } finally {
        client.close();
      }
    });
  }
}

/// Define events
abstract class FetchWeatherEvent {}

class FetchWeather extends FetchWeatherEvent {}

/// Define states
abstract class FetchWeatherState {}

class FetchWeatherInitial extends FetchWeatherState {}

class FetchWeatherProgress extends FetchWeatherState {}

class FetchWeatherSuccess extends FetchWeatherState {
  final WeatherModel climates;

  FetchWeatherSuccess({required this.climates});
}

class FetchWeatherFailure extends FetchWeatherState {
  final String error;

  FetchWeatherFailure(this.error);
}
