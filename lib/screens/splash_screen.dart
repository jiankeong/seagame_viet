import 'package:flutter/material.dart';

import '../globals.dart';
import './home_screen.dart';

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

      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Navigator.pushNamed(context, HomeScreen.routeName);
      });
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
    return Scaffold(
      body: Container(),
    );
  }
}
