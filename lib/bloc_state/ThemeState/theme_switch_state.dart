part of 'theme_switch_bloc.dart';

class ThemeSwitchState {
  final bool isDarkTheme;
  final ThemeDataModel selected;
  final int id;
  final List<ThemeDataModel> avaliableColors;
  final String currency;
  final String? lang;

  ThemeSwitchState(
      {required this.id,
      required this.currency,
      required this.lang,
      required this.isDarkTheme,
      required this.avaliableColors,
      required this.selected});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isDarkTheme': isDarkTheme,
    };
  }

  factory ThemeSwitchState.fromMap(Map<String, dynamic> map) {
    return ThemeSwitchState(
      lang: 'en',
      currency: "PKR",
      avaliableColors: avaliableThemes,
      selected: avaliableThemes[0],
      id: 0,
      isDarkTheme: map['isDarkTheme'] ?? false,
    );
  }
}

class ThemeSwitchInitial extends ThemeSwitchState {
  ThemeSwitchInitial(
      {
      required super.lang,
      required super.isDarkTheme,
      required super.id,
      required super.currency,
      required super.avaliableColors,
      required super.selected});
}
