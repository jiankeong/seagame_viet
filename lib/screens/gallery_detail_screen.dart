import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../widgets/gallery/gallery_photos.dart';

class GalleryDetailScreen extends StatefulWidget {
  static const routeName = '/GalleryDetail';

  @override
  _GalleryDetailScreenState createState() => _GalleryDetailScreenState();
}

class _GalleryDetailScreenState extends State<GalleryDetailScreen> {
  bool isInit = true;

  String? title = AppStrings.gallery.tr();

  List<List<Map<String, dynamic>>> _galleries = [
    [
      {
        "title": "The Moment Before The Miracle",
        "author": "SEA GAMES 2021",
        "image":
            'https://lh3.googleusercontent.com/_M7-Eh6jo7METexkXPjavFm5958IcgPQMxM1hCtplTsZhm9nrfQYFhcWR00ugxJqYhq0bzNjZGjIR38lVrMo4wlrglCSB1NK_w=w780-nu-rj-l80-e365',
      },
      {
        "title": "Shooting Range",
        "author": "SEA GAMES 2021",
        "image":
            'https://data.ibtimes.sg/en/full/11893/picture-for-representation.jpg?w=660',
      },
      {
        "title": "The Perfect Shoot",
        "author": "SEA GAMES 2021",
        "image":
            'https://www.usarchery.org/images/tinymce/160619154511-DSC03590.jpg',
      },
    ],
    [
      {
        "title": "Intense Moment",
        "author": "SEA GAMES 2021",
        "image":
            'https://eastonarchery.com/wp-content/uploads/2018/10/WORLD-CUP-STAGE-4-AND-ASIAN-GRAND-PRIX-HIGHLIGHT-THE-WEEK-AHEAD.jpg',
      },
    ]
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (isInit) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

      if (args != null && args['name'] != null) {
        title = args['name'];
      }
    }

    isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            title: title.toString().tr(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for(int i = 0; i < _galleries.length; i++)
                    GalleryPhotos(
                      day: i + 1,
                      photos: _galleries[i],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}