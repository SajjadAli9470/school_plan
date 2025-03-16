part of 'user_bloc.dart';

abstract class UserEvent {
  UserEvent();
}

class getLoggedInUser extends UserEvent {
  final UserModel user;
  final String? authToken;
  getLoggedInUser({required this.user, String? this.authToken});
}


class logoutUser extends UserEvent {
  logoutUser();
}
