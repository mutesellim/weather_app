import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/blocs/weather_bloc.dart';

class LastUpdateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
        cubit: _weatherBloc,
        builder: (context, WeatherState state) {
          var newDate = (state as WeatherLoadedState).weather.time.toLocal();
         return Text(
            "Son Güncelleme " + TimeOfDay.fromDateTime(newDate).format(context),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          );
          
        }
    );
  }
}
