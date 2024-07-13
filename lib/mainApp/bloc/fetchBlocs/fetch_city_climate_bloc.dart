import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../constants/api_endpoint.dart';
import '../../models/climate_model.dart';

class FetchWeatherBloc extends Bloc<FetchWeatherEvent, FetchWeatherState> {
  FetchWeatherBloc() : super(FetchWeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(FetchWeatherProgress());
      if (kDebugMode) debugPrint("FetchWeatherBloc started");
      var client = http.Client();
      try {
        var response = await client.get(
          Uri.parse('${ApiEndPoint.baseUrl}${ApiEndPoint.appId}'),
        );

        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          final climateList = WeatherModel.fromJson(jsonResponse);
          emit(FetchWeatherSuccess(climates: climateList));
        } else {
          emit(FetchWeatherFailure('Failed to fetch data. Status code: ${response.statusCode}'));
        }
      } catch (e) {
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
