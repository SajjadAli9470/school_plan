import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:myproduct/helpers/constants/images.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc()
      : super(NavigationState(activeIcon: defaultIcon, index: 0, history: [
          {0: defaultIcon}
        ], screens: [])) {
    on<goBack>((event, emit) {
      if (state.history.length > 1) {
        state.history.removeLast();
        emit(NavigationState(
            activeIcon: state.activeIcon,
            index: state.history.last.keys.first,
            history: state.history,
            screens: state.screens));
      }
    });
    on<selectIndex>((event, emit) {
      if (state.history.last != event.index) {
        emit(NavigationState(
            activeIcon: event.activeIcon,
            index: event.index,
            history: state.history..add({event.index: event.activeIcon}),
            screens: state.screens));
      }
    });
  }
}
