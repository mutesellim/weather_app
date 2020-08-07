part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeInitial extends ThemeState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();


}

class ApplicationTheme extends ThemeState {
  ThemeData theme;

  MaterialColor color;

  ApplicationTheme({@required this.theme, @required this.color});

  @override
  // TODO: implement props
  List<Object> get props => [theme,color];
}
