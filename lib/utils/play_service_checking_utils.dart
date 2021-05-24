import 'dart:io' show Platform;

import 'package:google_api_availability/google_api_availability.dart';
import 'shared_prefs.dart';

import '../constants/shared_prefs_constants.dart';

class PlayServiceCheckingUtils {
  Future<bool> isHuaweiChecking() async {
    GooglePlayServicesAvailability availability = await GoogleApiAvailability
        .instance
        .checkGooglePlayServicesAvailability();

    String status = availability.toString().split('.').last;

    if (status == 'success' || Platform.isIOS) {
      SharedPrefs().writeBool(kIsHuaweiSP, false);
      return false;
    } else {
      SharedPrefs().writeBool(kIsHuaweiSP, true);
      return true;
    }
  }
}
