import '../app_strings.dart';

abstract class UserTypeMapper {
  static const String public = AppStrings.public;
  static const String athleteOrParticipant = AppStrings.athleteOrParticipant;
  static const String admin = AppStrings.admin;
  static const String volunteer = AppStrings.volunteer;

  static String toUserTypeString(int userType) {
    if(userType == 0) return admin;
    if(userType == 1) return athleteOrParticipant;
    if(userType == 2) return volunteer;

    return public;
  }
}
