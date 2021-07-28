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
        "author": "NPC Bahrain",
        "image":
            'https://bocciacanada.ca/wp-content/uploads/2016/02/boccia.jpg',
      },
      {
        "title": "Shooting Range",
        "author": "NPC Bahrain",
        "image":
            'https://img.kyodonews.net/english/public/images/posts/febd94eb28786258ae11abdda1c14732/photo_l.jpg',
      },
      {
        "title": "The Perfect Shoot",
        "author": "NPC Bahrain",
        "image":
            'https://gravityboccia.com/wp-content/uploads/2017/08/IMG_0941.jpg',
      },
    ],
    [
      {
        "title": "Intense Moment",
        "author": "NPC Bahrain",
        "image":
            'https://gtimg.tokyo2020.org/image/private/t_article-image-desktop/production/bfuf8tk1ks2j2fg4zdks',
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