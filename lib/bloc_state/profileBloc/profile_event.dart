// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileEvent {}

class getProfileData extends ProfileEvent {
  final BuildContext context;
  final Function() onDone;

  getProfileData({required this.context, required this.onDone});
}

class getProfessionalRequireData extends ProfileEvent {
  final BuildContext context;
  final Function() onDone;

  getProfessionalRequireData({required this.context, required this.onDone});
}

class actionPersonal extends ProfileEvent {
  final Map<int, bool> action;
  final BuildContext context;
  final Function() onDone;

  actionPersonal(
      {required this.action, required this.context, required this.onDone});
}

class actionProfessional extends ProfileEvent {
  final Map<int, bool> action;
  final BuildContext context;
  final Function() onDone;

  actionProfessional(
      {required this.action, required this.context, required this.onDone});
}

class actionEmployment extends ProfileEvent {
  final Map<int, bool> action;
  final BuildContext context;
  final Function() onDone;

  actionEmployment(
      {required this.action, required this.context, required this.onDone});
}

class getParsedData extends ProfileEvent{
  final File file;
  final BuildContext context;
  final Function() onDone;

  getParsedData({required this.file, required this.context, required this.onDone});



}

class actionEducation extends ProfileEvent {
  final Map<int, bool> action;
  final BuildContext context;
  final Function() onDone;

  actionEducation(
      {required this.action, required this.context, required this.onDone});
}

class actionRefrence extends ProfileEvent {
  final Map<int, bool> action;
  final BuildContext context;
  final Function() onDone;

  actionRefrence(
      {required this.action, required this.context, required this.onDone});
}

class actionCertification extends ProfileEvent {
  final Map<int, bool> action;
  final BuildContext context;
  final Function() onDone;

  actionCertification(
      {required this.action, required this.context, required this.onDone});
}

class actionLangauge extends ProfileEvent {
  final Map<int, bool> action;
  final BuildContext context;
  final Function() onDone;

  actionLangauge(
      {required this.action, required this.context, required this.onDone});
}

class actionEmergency extends ProfileEvent {
  final Map<int, bool> action;
  final BuildContext context;
  final Function() onDone;

  actionEmergency(
      {required this.action, required this.context, required this.onDone});
}

class actionResume extends ProfileEvent {
  final Map<int, bool> action;
  final BuildContext context;
  final Function() onDone;

  actionResume(
      {required this.action, required this.context, required this.onDone});
}

class actionIntro extends ProfileEvent {
  final Map<int, bool> action;
  final BuildContext context;
  final Function() onDone;

  actionIntro(
      {required this.action, required this.context, required this.onDone});
}

// Selecting a component

class loadingProfile extends ProfileEvent {
  final String key;
  final bool isLoading;
  Function() onDone;

  loadingProfile({
    required this.key,
    required this.isLoading,
    required this.onDone,
  });
}

class logoutProfile extends ProfileEvent {
  logoutProfile();
}
class getCountriesStates extends ProfileEvent {

  Function() onDone;
  BuildContext context;
  getCountriesStates({
    required this.context,
  
    required this.onDone,
  });
}

class actionLoadingProfile extends ProfileEvent {
  final String main_key;
  final Map<int, bool> action;
  final bool isLoading;

  actionLoadingProfile(
      {required this.main_key, required this.action, required this.isLoading});
}

class getProfileCompeleteness extends ProfileEvent {}
