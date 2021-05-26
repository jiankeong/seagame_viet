import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles.dart';
import '../../utils/general_functions.dart';
import '../../globals.dart';
import '../default_cache_network_image.dart';
import './full_photo_dialog_layout.dart';

class GalleryPhotos extends StatelessWidget {
  final int day;
  final List<Map<String, dynamic>>? photos;

  GalleryPhotos({
    this.day = 1,
    this.photos,
  });

  @override
  Widget build(BuildContext context) {
    return photos != null && photos!.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                ),
                decoration: BoxDecoration(
                  color: Styles.whiteColor,
                ),
                child: Text(
                  'Day ${formatSingleDigitToDoubleDigit(day)}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Styles.regularFontSize,
                    fontWeight: Styles.boldText,
                  ),
                ),
              ),
              Wrap(
                direction: Axis.horizontal,
                spacing: 1.w,
                runSpacing: 1.w,
                children: [
                  for (Map<String, dynamic> photo in photos!)
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierColor: Colors.black87,
                            builder: (context) {
                              return FullPhotoDialogLayout(
                                photoUrl: photo['image'],
                                title: photo['title'],
                                author: photo['author'],
                              );
                            });
                      },
                      child: DefaultCacheNetworkImage(
                        imageUrl: photo['image'],
                        width: Globals().getScreenWidth() * 0.33,
                        height: Globals().getScreenWidth() * 0.33,
                      ),
                    ),
                ],
              ),
            ],
          )
        : Container();
  }
}
