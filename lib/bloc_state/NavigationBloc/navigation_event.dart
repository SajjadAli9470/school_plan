// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'navigation_bloc.dart';

class NavigationEvent {}

class goBack extends NavigationEvent {}

class selectIndex extends NavigationEvent {
  int index;
  String activeIcon;
  selectIndex({required this.index, required this.activeIcon});
}
