import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_app/data/weather_repository.dart';
import 'package:flutter_weather_app/locator.dart';
import 'package:flutter_weather_app/models/weather.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  final WeatherRepository weatherRepository = locator<WeatherRepository>();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeatherEvent) {
      yield WeatherLoadingState();
      try {
        final Weather getWeather = await weatherRepository.getWeather(event.cityName);
        yield WeatherLoadedState(weather: getWeather);
      } catch (_) {
        yield WeatherErrorState();
      }
    }else if (event is RefreshWeatherEvent) {
      try {
        final Weather getWeather = await weatherRepository.getWeather(event.cityName);
        yield WeatherLoadedState(weather: getWeather);
      } catch (_) {
        yield state;
      }
    }

  }
}
