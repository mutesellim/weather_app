import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/blocs/theme/theme_bloc.dart';
import 'package:flutter_weather_app/blocs/weather_bloc.dart';
import 'package:flutter_weather_app/widget/background_color.dart';
import 'package:flutter_weather_app/widget/choose_city.dart';
import 'package:flutter_weather_app/widget/last_update.dart';
import 'package:flutter_weather_app/widget/location.dart';
import 'package:flutter_weather_app/widget/maxmin_temperature.dart';
import 'package:flutter_weather_app/widget/weather_state_picture.dart';

class WeatherApp extends StatelessWidget {
  String currentCity = "Ankara";
  Completer<void> _refreshCompleter = Completer<void>();

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              currentCity = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChooseCityWidget()));
              if (currentCity != null) {
                _weatherBloc.add(FetchWeatherEvent(cityName: currentCity));
              }
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder(
          cubit: _weatherBloc,
          builder: (context, WeatherState state) {
            if (state is WeatherInitial) {
              return Center(
                child: Text("Şehir Seçiniz"),
              );
            }
            if (state is WeatherLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is WeatherLoadedState) {
              final getWeather = state.weather;
              final _weatherShortName =
                  getWeather.consolidatedWeather[0].weatherStateAbbr;
              currentCity = getWeather.title;
              BlocProvider.of<ThemeBloc>(context)
                  .add(ThemeChangeEvent(weatherShortName: _weatherShortName));
              _refreshCompleter.complete();
              _refreshCompleter = Completer();

              return BlocBuilder(
                cubit: BlocProvider.of<ThemeBloc>(context),
                builder: (context, ThemeState themeState) =>
                    BackgroundColorContainer(
                  color: (themeState as ApplicationTheme).color,
                  child: RefreshIndicator(
                    onRefresh: () {
                      _weatherBloc
                          .add(RefreshWeatherEvent(cityName: currentCity));
                      return _refreshCompleter.future;
                    },
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: LocationWidget(
                              choosedCity: getWeather.title,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: LastUpdateWidget()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: WeatherStatePicture()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: MaxMinTemperatureWidget()),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            if (state is WeatherErrorState) {
              return Center(
                child: Text("Hata Oluştu"),
              );
            }
          },
        ),
      ),
    );
  }
}
