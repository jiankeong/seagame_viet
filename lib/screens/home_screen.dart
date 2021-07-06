import 'package:flutter/material.dart';

import '../widgets/header_profile_container.dart';
import '../widgets/home_screen.dart/home_screen_widgets.dart';
import '../widgets/default_sized_box.dart';
import '../globals.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          HeaderProfileContainer(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: DashboardOptionsGrid(),
                  ),
                  DefaultSizedBox.vertical(15),
                  HomeScreenWelcomeBanner(),
                  _addBottomSpacing(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addBottomSpacing() {
    double spacing = 45;

    double screenHeight = Globals().getScreenHeight();

    if (screenHeight == 800) {
      spacing = 0;
    }

    return DefaultSizedBox.vertical(spacing);
  }
}
