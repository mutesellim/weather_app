import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial());

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    ApplicationTheme applicationTheme;

    if (event is ThemeChangeEvent) {
      switch (event.weatherShortName) {
        case "sn":
        case "sl":
        case "h":
        case "t":
        case "hc":
          applicationTheme = ApplicationTheme(
              theme: ThemeData(primaryColor: Colors.blue), color: Colors.grey);
          break;

        case "hr":
        case "lr":
        case "s":
          applicationTheme = ApplicationTheme(
              theme: ThemeData(primaryColor: Colors.green),
              color: Colors.amber);
          break;

        case "lc":
        case "c":
          applicationTheme = ApplicationTheme(
              theme: ThemeData(primaryColor: Colors.yellow), color: Colors.red);
          break;
      }
      yield applicationTheme;
    }
  }
}
