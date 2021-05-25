import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void buildToast1(String? message, {bool shouldTranslate = true}) {
  if (message != null) {
    Fluttertoast.showToast(
      msg: shouldTranslate ? message.tr() : message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: ScreenUtil().setSp(14),
    );
  }
}
