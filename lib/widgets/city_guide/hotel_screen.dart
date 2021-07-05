import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_shadow_container.dart';
import '../default_cache_network_image.dart';
import '../../styles.dart';
import '../default_rating_bar.dart';
import '../default_sized_box.dart';

class HotelScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _hotelList = [
    {
      "name": "Four Seasons Hotel Bahrain Bay",
      "location": "Bahrain Bay, Manama, Bahrain",
      "rating": 5.0,
      "rating_count": 3802,
      "image":
          "https://cf.bstatic.com/images/hotel/max1024x768/430/43064438.jpg",
    },
    {
      "name": "Diva Hotel",
      "location": "Building 879, Road 2414, Block 324 Juffair, 340, Bahrain",
      "rating": 3.8,
      "rating_count": 9,
      "image":
          "https://cf.bstatic.com/xdata/images/hotel/max1280x900/299977573.jpg?k=cf458daf487a1c7f18977e1bb5d612109d0853c64a39d75a417edc3c05ef6793&o=&hp=1"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        Map<String, dynamic> hotel = _hotelList[index];

        return Column(
          children: [
            CustomShadowContainer(
              roundedCorner: false,
              child: Row(
                children: [
                  DefaultCacheNetworkImage(
                    imageUrl: hotel['image'],
                    height: 148.h,
                    width: 148.h,
                  ),
                  Flexible(
                      child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 10.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hotel['name'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: Styles.smallerTitleFontSize,
                          ),
                        ),
                        DefaultSizedBox.vertical(10),
                        Text(
                          hotel['location'],
                          style: TextStyle(
                              fontSize: Styles.smallerRegularSize,
                              color: Styles.suvaGrey),
                        ),
                        DefaultSizedBox.vertical(10),
                        Row(
                          children: [
                            Text(
                              hotel['rating'].toStringAsFixed(1),
                              style: TextStyle(
                                color: Styles.suvaGrey,
                                fontSize: Styles.smallerRegularSize,
                              ),
                            ),
                            DefaultSizedBox.horizontal(5),
                            DefaultRatingBar(
                              initalRating: hotel['rating'],
                              iconColor: Styles.blackColor,
                            ),
                            DefaultSizedBox.horizontal(5),
                            Text(
                              '(${hotel['rating_count']})',
                              style: TextStyle(
                                color: Styles.suvaGrey,
                                fontSize: Styles.smallerRegularSize,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            DefaultSizedBox.vertical(15),
          ],
        );
      },
      itemCount: _hotelList.length,
    );
  }
}
