import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:myproduct/models/themeModel.dart';
import 'package:myproduct/app_theme.dart';
part 'theme_switch_event.dart';
part 'theme_switch_state.dart';

class ThemeSwitchBloc extends Bloc<ThemeSwitchEvent, ThemeSwitchState> {
  ThemeSwitchBloc()
      : super(ThemeSwitchInitial(
            lang:'en',
            id: 0,
            currency: "\$",
            isDarkTheme: false,
            selected: avaliableThemes.first,
            avaliableColors: avaliableThemes)) {
    on<ChangePrimaryColors>((event, emit) {
      emit(ThemeSwitchState(
          lang: state.lang,
          currency: state.currency,
          isDarkTheme: state.isDarkTheme,
          id: event.primaryColor.id,
          selected: event.primaryColor,
          avaliableColors: state.avaliableColors));
    });
    on<ThemeSwitchOnEvent>((event, emit) {
      emit(ThemeSwitchState(
          lang: state.lang,
          id: state.selected.id,
          currency: state.currency,
          selected: state.selected,
          avaliableColors: state.avaliableColors,
          isDarkTheme: true));
    });
    on<changeCurrency>((event, emit) {
      emit(ThemeSwitchState(
          lang: state.lang,
          id: state.selected.id,
          currency: event.currency,
          selected: state.selected,
          avaliableColors: state.avaliableColors,
          isDarkTheme: true));
    });

    on<changeLang>((event, emit) {
      emit(ThemeSwitchState(
          lang: event.lang,
          id: state.selected.id,
          currency: state.currency,
          selected: state.selected,
          avaliableColors: state.avaliableColors,
          isDarkTheme: true));
    });
    on<ThemeSwitchOffEvent>((event, emit) {
      emit(ThemeSwitchState(
        lang: state.lang,
        id: state.selected.id,
        selected: state.selected,
        currency: state.currency,
        avaliableColors: state.avaliableColors,
        isDarkTheme: false,
      ));
    });
    on<ThemeRefreshEvent>((event, emit) {
      emit(ThemeSwitchState(
          lang: state.lang,
          id: state.selected.id,
          currency: state.currency,
          selected: state.selected,
          avaliableColors: state.avaliableColors,
          isDarkTheme: state.isDarkTheme));
    });
  }
  bool get currentThemeMode => state.isDarkTheme;

  @override
  ThemeSwitchState? fromJson(Map<String, dynamic> json) {
    return ThemeSwitchState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeSwitchState state) {
    return state.toMap();
  }
}
