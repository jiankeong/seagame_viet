import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../globals.dart';
import '../icon_image_path.dart';
import '../app_strings.dart';
import '../styles.dart';
import '../widgets/default_sized_box.dart';
import '../constants/app_constants.dart';
import '../widgets/default_padding.dart';
import '../widgets/text_pressable.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (isInit) {
      initData();
    }

    isInit = false;
  }

  Future<void> initData() async {
    initScreenSize();
  }

  void initScreenSize() {
    Size screenSize = MediaQuery.of(context).size;

    Globals().setScreenSize(
      screenHeight: screenSize.height,
      screenWidth: screenSize.width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.splashBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: DefaultPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultSizedBox.vertical(65),
                Flexible(
                  child: _buildLogo(),
                ),
                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 15.w,
          ),
          child: Image.asset(
            AppImages.logo,
            width: 260.h,
            height: 260.h,
            fit: BoxFit.cover,
          ),
        ),
        DefaultSizedBox.vertical(25),
        Text(
          AppStrings.welcome.tr().toUpperCase(),
          style: TextStyle(
            color: Styles.primaryColor,
            fontSize: 34.sp,
            fontWeight: Styles.boldText,
          ),
        )
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppStrings.copyright.tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Styles.smallerRegularSize,
            color: Styles.primaryDarkColor,
            fontWeight: Styles.boldText,
          ),
        ),
        DefaultSizedBox.vertical(15),
        IntrinsicHeight(
          child: Padding(
            padding: EdgeInsets.only(
              left: 8.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextPressable(
                  label: AppStrings.termsOfUse.tr(),
                  onPressed: () {},
                ),
                DefaultSizedBox.horizontal(10),
                VerticalDivider(
                  thickness: 1.0.w,
                  color: Styles.primaryDarkColor,
                ),
                DefaultSizedBox.horizontal(10),
                TextPressable(
                  label: AppStrings.privacyStatement.tr(),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        DefaultSizedBox.vertical(8),
        Text(
          '${AppStrings.version.tr()} $kAppVersion',
          style: TextStyle(
            fontSize: Styles.smallerRegularSize,
            color: Styles.primaryDarkColor,
            fontWeight: Styles.boldText,
          ),
        ),
        DefaultSizedBox.vertical(20),
      ],
    );
  }
}
