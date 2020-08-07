import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/blocs/theme/theme_bloc.dart';
import 'package:flutter_weather_app/blocs/weather_bloc.dart';
import 'package:flutter_weather_app/locator.dart';
import 'package:flutter_weather_app/widget/weather_app.dart';

void main() {
  setupLocator();
  runApp(BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: BlocProvider.of<ThemeBloc>(context),
      builder: (context, ThemeState themeState) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Weather App",
        theme: ThemeData(),
        home: BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(), child: WeatherApp()),
      ),
    );
  }
}
