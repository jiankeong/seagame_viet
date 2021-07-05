import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../globals.dart';
import '../icon_image_path.dart';
import '../widgets/default_sized_box.dart';
import '../widgets/default_padding.dart';
import '../styles.dart';
import '../widgets/splash_login_shared/splash_login_logo.dart';
import '../screens/login_screen.dart';
import '../app_strings.dart';
import '../widgets/custom_circular_progress_indicator.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isInit = true;

  bool isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (isInit) {
      initData();
    }

    isInit = false;
  }

  Future<void> initData() async {
    setState(() {
      isLoading = true;
    });

    initScreenSize();

    await Future.delayed(Duration(seconds: 2));

    Navigator.pushReplacementNamed(
      context,
      LoginScreen.routeName,
    );
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DefaultSizedBox.vertical(65),
                Flexible(
                  child: SplashLoginLogo(
                    // leftPadding: 10,
                  ),
                ),
                if (isLoading)
                  Center(
                    child: CustomCircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  ),
                DefaultSizedBox.vertical(25),
                Text(
                  AppStrings.copyright.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Styles.smallerRegularSize,
                    color: Styles.primaryDarkColor,
                    fontWeight: Styles.boldText,
                  ),
                ),
                DefaultSizedBox.vertical(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
