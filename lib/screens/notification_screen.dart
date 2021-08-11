import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../widgets/default_padding.dart';
import '../widgets/sport_icon_container.dart';
import '../widgets/profile_avatar.dart';
import 'package:sea_games_gms/icon_image_path.dart';
import '../styles.dart';
import '../widgets/default_sized_box.dart';
import '../utils/date_format_utils.dart';
import '../utils/enums.dart';
import '../widgets/default_divider.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = '/Notification';

  final List<Map<String, dynamic>> _notifications = [
    {
      "type": 1,
      "title": "WheelChair Basketball",
      "content": "Malaysian Ends the Prelims with a Dunk.",
      "image": AppIcons.paraBasketball,
      "isAsset": false,
      "date": DateTime.parse('2021-05-12 08:00:00'),
    },
    {
      "type": 2,
      "title": "Player Update",
      "content": "C.W. Lee nets another gold for the Malaysian Contingent",
      "image":
          'https://d3avoj45mekucs.cloudfront.net/rojakdaily/media/1nichoras/malaysia/lcw.jpg?ext=.jpg',
      "isAsset": false,
      "date": DateTime.parse('2021-05-12 08:00:00'),
    },
    {
      "type": 3,
      "title": "Player Update",
      "content": "C.W. Lee nets another gold for the Malaysian Contingent",
      "image": AppImages.logoArt3,
      "isAsset": true,
      "date": DateTime.parse('2021-05-12 08:00:00'),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            title: AppStrings.notification.tr(),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemBuilder: (context, index) {
                Map<String, dynamic> notification = _notifications[index];

                return Column(
                  children: [
                    DefaultPadding(
                      top: 25,
                      bottom: 25,
                      child: NotificationContainer(
                        type: notification['type'],
                        title: notification['title'],
                        content: notification['content'],
                        image: notification['image'],
                        isImageAsset: notification['isAsset'],
                        date: notification['date'],
                      ),
                    ),
                    DefaultPadding(child: DefaultDivider()),
                  ],
                );
              },
              itemCount: _notifications.length,
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationContainer extends StatelessWidget {
  final int type;
  final String title;
  final String content;
  final String? image;
  final bool isImageAsset;
  final DateTime? date;

  NotificationContainer({
    this.type = 0,
    this.title = 'SEA GAMES 2021',
    this.image = '',
    this.content = '',
    this.date,
    this.isImageAsset = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildLeading(),
        DefaultSizedBox.horizontal(15),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: Styles.regularFontSize,
                      color: Styles.primaryColor,
                    ),
                  ),
                  Text(
                    DateFormatUtils.dateWithTime(
                        date ?? DateTime.parse('2021-05-12 08:00:00')),
                    style: TextStyle(
                      fontSize: Styles.smallerRegularSize,
                      color: Styles.suvaGrey,
                    ),
                  )
                ],
              ),
              DefaultSizedBox.vertical(10),
              Text(
                content,
                style: TextStyle(
                  fontSize: Styles.regularFontSize,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLeading() {
    if (type == 1) {
      return SportIconContainer(
        icon: image,
        size: 46.h,
      );
    }

    return ProfileAvatar(
      profileImgUrl: image,
      imageType: isImageAsset ? ImageType.asset : ImageType.network,
    );
  }
}
