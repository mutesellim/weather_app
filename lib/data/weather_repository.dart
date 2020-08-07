import 'package:flutter_weather_app/data/weather_api_client.dart';
import 'package:flutter_weather_app/locator.dart';
import 'package:flutter_weather_app/models/weather.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWeather(String city) async {

    final int cityID =await weatherApiClient.getLocationID(city);
    return await weatherApiClient.getWeather(cityID);
  }
}
