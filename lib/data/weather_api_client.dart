import 'dart:convert';

import 'package:flutter_weather_app/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = "https://www.metaweather.com";
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String cityName) async {
    final cityURL = baseUrl + "/api/location/search/?query=" + cityName;
    final response = await httpClient.get(cityURL);
    if (response.statusCode != 200) {
      throw Exception("Veri Getirilemedi");
    }
    final responseJSON = (jsonDecode(response.body)) as List;
    return responseJSON[0]["woeid"];
  }


  Future<Weather> getWeather(int cityID) async{
    final weatherStatusURL = baseUrl+"/api/location/$cityID";
    final weatherStatusResponse=await httpClient.get(weatherStatusURL);
    if(weatherStatusResponse.statusCode!=200){
      throw Exception("Hava Durumu Getirilemedi");
    }
    final weatherStatusResponseJSON = jsonDecode(weatherStatusResponse.body);
    return Weather.fromJson(weatherStatusResponseJSON);
  }
}
