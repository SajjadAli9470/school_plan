// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'navigation_bloc.dart';

class NavigationState {
  int index;
  String activeIcon;
  List<Map<int,String>> history;
  List<Widget> screens;
  NavigationState({
    required this.index,
    required this.history,
    required this.screens,
    required this.activeIcon
  });
}
