import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../widgets/custom_shadow_container.dart';
import '../widgets/default_sized_box.dart';
import '../styles.dart';
import '../widgets/default_padding.dart';
import '../constants/app_constants.dart';
import '../widgets/default_cache_network_image.dart';
import '../widgets/sport_icon_container.dart';
import '../icon_image_path.dart';
import '../widgets/youtube_iframe.dart';

class MediaScreen extends StatelessWidget {
  static const routeName = '/Media';

  final List<Map<String, dynamic>> highlights = [
    {
      "title": "Lee to face against old rivals. Will he prevail?",
      "image":
          "https://apicms.thestar.com.my/uploads/images/2020/02/29/582079.jpg",
      "duration": "9:06",
      "url": "8wI6NOG0mLg",
    },
    {
      "title": "Malaysian Ends the Prelims with a Dunk.",
      "image":
          "http://www.fiba.basketball/images.fiba.com/Graphic/5/4/5/D/NYgiZHhBRkWOIk7dR_wGtQ.jpg?v=20210129151120596",
      "duration": "10:01",
      "url": "Hkc0ji-b4xA",
    },
  ];

  final List<Map<String, dynamic>> basketball = [
    {
      "title": "Malaysian Ends the Prelims with a Dunk.",
      "image":
          "http://www.fiba.basketball/images.fiba.com/Graphic/5/4/5/D/NYgiZHhBRkWOIk7dR_wGtQ.jpg?v=20210129151120596",
      "duration": "10:01",
      "url": "Hkc0ji-b4xA",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultAppBar(
            title: AppStrings.media.tr(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultSizedBox.vertical(35),
                  DefaultPadding(
                    child: Text(
                      'PARA GAMES Highlights',
                      style: TextStyle(
                        color: Styles.primaryColor,
                        fontSize: 21.sp,
                        fontWeight: Styles.boldText,
                      ),
                    ),
                  ),
                  DefaultSizedBox.vertical(25),
                  MediaList(medias: highlights),
                  DefaultSizedBox.vertical(15),
                  DefaultPadding(
                    child: Row(
                      children: [
                        SportIconContainer(
                          icon: AppIcons.basketball,
                          size: 24.h,
                        ),
                        DefaultSizedBox.horizontal(15),
                        Text(
                          AppStrings.basketball.tr(),
                          style: TextStyle(
                            fontSize: Styles.smallerTitleFontSize,
                            fontWeight: Styles.boldText,
                            color: Styles.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DefaultSizedBox.vertical(20),
                  MediaList(medias: basketball),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MediaList extends StatelessWidget {
  const MediaList({
    Key? key,
    required this.medias,
  }) : super(key: key);

  final List<Map<String, dynamic>> medias;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Map<String, dynamic> highlight = medias[index];

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0)
                DefaultSizedBox.horizontal(kDefaultScreenHorizontalPadding),
              MediaContainer(media: highlight),
              DefaultSizedBox.horizontal(
                index < medias.length - 1
                    ? 15.w
                    : kDefaultScreenHorizontalPadding.w,
              ),
            ],
          );
        },
        itemCount: medias.length,
      ),
    );
  }
}

class MediaContainer extends StatelessWidget {
  const MediaContainer({
    Key? key,
    required this.media,
  }) : super(key: key);

  final Map<String, dynamic> media;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => YoutubeIframe(
                  videoId: media['url'],
                ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediaThumbnailContainer(media: media),
          DefaultSizedBox.vertical(15),
          SizedBox(
            width: 200.w,
            child: Text(
              media['title'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: Styles.smallerTitleFontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MediaThumbnailContainer extends StatelessWidget {
  const MediaThumbnailContainer({
    Key? key,
    required this.media,
  }) : super(key: key);

  final Map<String, dynamic> media;

  @override
  Widget build(BuildContext context) {
    return CustomShadowContainer(
      width: 217.w,
      height: 126.h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.h),
            child: DefaultCacheNetworkImage(
              width: 217.w,
              height: 126.h,
              imageUrl: media['image'],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 10.w,
              ),
              decoration: BoxDecoration(
                  color: Styles.blackColor.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.h),
                    topRight: Radius.circular(15.h),
                  )),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.play_arrow,
                    size: 18.h,
                    color: Styles.whiteColor,
                  ),
                  DefaultSizedBox.horizontal(5),
                  Text(
                    media['duration'],
                    style: TextStyle(
                      color: Styles.whiteColor,
                      fontSize: Styles.regularFontSize,
                      fontWeight: Styles.boldText,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
