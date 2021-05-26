import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share/share.dart';

import '../default_padding.dart';
import '../default_cache_network_image.dart';
import '../../styles.dart';
import '../default_sized_box.dart';
import '../../icon_image_path.dart';

class FullPhotoDialogLayout extends StatelessWidget {
  final String photoUrl;
  final String title;
  final String author;

  FullPhotoDialogLayout(
      {this.photoUrl = '', this.title = '', this.author = ''});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: DefaultPadding(
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultCacheNetworkImage(
                      imageUrl: photoUrl,
                    ),
                    DefaultSizedBox.vertical(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: Styles.titleFontSize,
                              color: Styles.whiteColor),
                        ),
                        DefaultSizedBox.vertical(10),
                        Text('By $author',
                            style: TextStyle(
                              color: Styles.whiteColor,
                              fontSize: Styles.regularFontSize,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        AppIcons.cancel,
                        width: 20.h,
                        height: 20.h,
                        fit: BoxFit.fill,
                        color: Styles.whiteColor,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AppIcons.save,
                          width: 28.h,
                          height: 28.h,
                          fit: BoxFit.fill,
                          color: Styles.whiteColor,
                        ),
                        DefaultSizedBox.horizontal(15),
                        InkWell(
                          onTap: () {
                            Share.share('SEA Games 2021 Moment',
                                subject: title);
                          },
                          child: Image.asset(
                            AppIcons.share,
                            width: 24.h,
                            height: 24.h,
                            fit: BoxFit.contain,
                            color: Styles.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
