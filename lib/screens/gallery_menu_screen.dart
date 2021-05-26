import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/default_sport_grid.dart';
import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import './gallery_detail_screen.dart';

class GalleryMenuScreen extends StatelessWidget {
  static const routeName = '/GalleryMenu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            title: AppStrings.gallery.tr(),
          ),
          Expanded(
            child: DefaultSportGrid(
              moveToScreenRouteName: GalleryDetailScreen.routeName,
            ),
          ),
        ],
      ),
    );
  }
}
