import 'package:easy_localization/easy_localization.dart';
import 'package:sea_games_gms/app_strings.dart';

import '../app_strings.dart';

class InputValidationsUtils {
  // static bool isPhoneNumberFull(String phoneNumber) {
  //   return RegExp(r"^(\+?6?01)[0-46-9]-*[0-9]{7,8}$").hasMatch(phoneNumber);
  // }

  static bool isEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static String? validateEmptyString(String? val) {
    if (val.toString().trim() == "") {
      return AppStrings.emptyInputError.tr();
    }

    return null;
  }

  static String? validateConfirmPassword(String? val, String? valToCompare) {
    if (val.toString().trim() == "") {
      return AppStrings.emptyInputError.tr();
    } else if (val != valToCompare) {
      return AppStrings.passwordNotSameError.tr();
    }

    return null;
  }

  static String? validateEmail(String? val) {
    if (val == "") {
      return AppStrings.emptyInputError.tr();
    } else if (!isEmail(val as String)) {
      return AppStrings.invalidEmailFormat.tr();
    }
    return null;
  }

  // static String? validatePhoneNumber(String? val) {
  //   if (val.toString().trim() == "") {
  //     return AppStrings.emptyInputError.tr();
  //   } else if (!InputValidationsUtils.isPhoneNumberFull(val as String)) {
  //     return AppStrings.invalidMobileNumber.tr();
  //   }

  //   return null;
  // }
}
