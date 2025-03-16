// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_switch_bloc.dart';

abstract class ThemeSwitchEvent {}

class ThemeSwitchOnEvent extends ThemeSwitchEvent {}

class ThemeSwitchOffEvent extends ThemeSwitchEvent {}

class ThemeRefreshEvent extends ThemeSwitchEvent {}

class changeCurrency extends ThemeSwitchEvent {
  String currency;
  changeCurrency({
    required this.currency,
  });
  
}
class changeLang extends ThemeSwitchEvent {
  String lang;
  changeLang({
    required this.lang,
  });
  
}

class ChangePrimaryColors extends ThemeSwitchEvent {
  final ThemeDataModel primaryColor;

  ChangePrimaryColors({
    required this.primaryColor,
  });
}


