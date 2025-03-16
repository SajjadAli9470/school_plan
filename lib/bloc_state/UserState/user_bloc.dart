import 'dart:developer';



import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:myproduct/models/userModel.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends HydratedBloc<UserEvent, UserState> {
  UserBloc() : super(InitialUserState()) {
    on<getLoggedInUser>((event, emit) {


      emit(UserState(
      
          loggedInUser: event.user,
    
          auth_token: event.user.authtoken,));
    });


    on<logoutUser>((event, emit) {
      emit(UserState(
       
          loggedInUser: null,
         
          auth_token: null));
    });
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      try {
        final user = UserModel.fromMap(json);
       
        return UserState(
    
            loggedInUser: user,
            auth_token: user.authtoken,
            );
      } catch (e) {
        log("Error while getting User Details : $e");
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    try {
      return state.loggedInUser == null ? {} : state.loggedInUser?.toMap();
    } catch (e) {
      log("error while saving $e");
      return null;
    }
  }
}
