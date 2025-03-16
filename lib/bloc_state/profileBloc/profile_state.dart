// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileState {

  final Map<String, bool> isLoading;



  ProfileState(
      {
        
        
      required this.isLoading,
      });

  ProfileState copyWith(
      {Map<String, bool>? isLoading,}) {
    return ProfileState(
      
      isLoading: isLoading ?? this.isLoading,
      
    );
  }
}

class ProfileInitial extends ProfileState {
  ProfileInitial()
      : super(
        
            isLoading: {},
            );
}
