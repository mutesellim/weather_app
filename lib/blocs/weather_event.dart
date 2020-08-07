part of 'weather_bloc.dart';


abstract class WeatherEvent extends Equatable {
  const WeatherEvent(List<String> list);
}

class FetchWeatherEvent extends WeatherEvent {
  final String cityName;
  FetchWeatherEvent({@required this.cityName}):super([cityName]);

  @override
  // TODO: implement props
  List<Object> get props => [];

}


class RefreshWeatherEvent extends WeatherEvent {
  final String cityName;
  RefreshWeatherEvent({@required this.cityName}):super([cityName]);

  @override
  // TODO: implement props
  List<Object> get props => [];

}

