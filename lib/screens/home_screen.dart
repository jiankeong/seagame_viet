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
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderProfileContainer(),
            Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: DashboardOptionsGrid(),
                  ),
                ),
                DefaultSizedBox.vertical(12),
                HomeScreenWelcomeBanner(),
                _addBottomSpacing(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _addBottomSpacing() {
    double spacing = 0;

    if (Globals().getScreenHeight() < 600) {
      spacing = 45;
    }

    return DefaultSizedBox.vertical(spacing);
  }
}
