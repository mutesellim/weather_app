part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeChangeEvent extends ThemeEvent{
  final String weatherShortName;
  ThemeChangeEvent({@required this.weatherShortName});

  @override
  // TODO: implement props
  List<Object> get props => [];
}