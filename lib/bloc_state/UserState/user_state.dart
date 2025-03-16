part of 'user_bloc.dart';

class UserState {
  final UserModel? loggedInUser;
  final String? auth_token;

  UserState(
      {
      required this.loggedInUser,
      required this.auth_token
      });
}

class InitialUserState extends UserState {
  InitialUserState()
      : super(
        
            loggedInUser: null,
            auth_token: null,);
}
