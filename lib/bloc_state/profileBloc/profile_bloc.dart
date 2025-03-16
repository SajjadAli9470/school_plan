import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'profile_event.dart';
part 'profile_state.dart';

final String key_add = 'key_add';
final String key_delete = 'key_delete';
final String key_edit = 'key_edit';
final String key_parsing = 'key_parsing';

final String key_personal = 'key_personal';
final String key_profesional_requiredData = 'key_profesional_requiredData';
final String key_fullprofile = 'key_fullprofile';
final String key_professional = 'key_professional';
final String key_employment = 'key_employment';
final String key_education = 'key_education';
final String key_reference = 'key_reference';
final String key_certification = 'key_certification';
final String key_languages = 'key_languages';
final String key_emergency = 'key_emergency';
final String key_resume = 'key_resume';
final String key_introvideo = 'key_introvideo';
final String key_countries = 'key_introvideo';

final int code_add = 0;
final int code_edit = 1;
final int code_delete = 2;

getMyUniqueKey(
    {required String main, required String function, String? addon}) {
  // log("New Key is Generated :${"${main}${function}${addon ?? ''}"} ");
  return "${main}${function}${addon ?? ''}";
}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
   
    on<actionLoadingProfile>(
      (event, emit) {
        // log("I am called ${event.action}");
        if ((event.action[code_add] ?? false) == true) {
          // log("I am called one ${event.action}");
          add(loadingProfile(
              key: getMyUniqueKey(main: event.main_key, function: key_add),
              isLoading: event.isLoading,
              onDone: () {
                add(getProfileCompeleteness());
              }));
        } else if ((event.action[code_edit] ?? false) == true) {
          add(loadingProfile(
              key: getMyUniqueKey(main: event.main_key, function: key_edit),
              isLoading: event.isLoading,
              onDone: () {
                add(getProfileCompeleteness());
              }));
        } else if ((event.action[code_delete] ?? false) == true) {
          add(loadingProfile(
              key: getMyUniqueKey(main: event.main_key, function: key_delete),
              isLoading: event.isLoading,
              onDone: () {
                add(getProfileCompeleteness());
              }));
        } else {
          log("No Valid Key's are given");
        }
      },
    );
    on<loadingProfile>((event, emit) {
      emit(state.copyWith(
        isLoading: state.isLoading
          ..update(event.key, (v) {
            return event.isLoading;
          }, ifAbsent: () {
            return event.isLoading;
          }),
      ));
      event.onDone.call();
      // log("Event ${event.key} :${event.isLoading}");
      // log("State ${state.isLoading}");
    });
    on<logoutProfile>(
      (event, emit) {
        emit(ProfileInitial());
      },
    );
  }
}

// emit(ProfileState(
//     missingData: state.missingData,
//     isLoading: state.isLoading
//       ..update(event.key, (v) {
//         return event.isLoading;
//       }, ifAbsent: () {
//         return event.isLoading;
//       }),
//     personalInformation: state.personalInformation,
//     selected_personalInformation: state.selected_personalInformation,
//     professionalinformation: state.professionalinformation,
//     selected_professionalinformation:
//         state.selected_professionalinformation,
//     employmentHistory: state.employmentHistory,
//     selected_employmentHistory: state.selected_employmentHistory,
//     educationHistory: state.educationHistory,
//     selected_educationHistory: state.selected_educationHistory,
//     languages: state.languages,
//     selected_languages: state.selected_languages,
//     emergencyContact: state.emergencyContact,
//     selected_emergencyContact: state.selected_emergencyContact,
//     selected_resume: state.selected_resume,
//     resume: state.resume,
//     introvideo: state.introvideo,
//     selected_introvideo: state.selected_introvideo,
//     certifications: state.certifications,
//     selected_certifications: state.selected_certifications));
