import '../app_strings.dart';

abstract class UserTypeMapper {
  static const public = AppStrings.public;
  static const athleteOrParticipant = AppStrings.athleteOrParticipant;

  static String toUserTypeString(int userType) {
    if(userType == 1) return athleteOrParticipant;

    return public;
  }
}
