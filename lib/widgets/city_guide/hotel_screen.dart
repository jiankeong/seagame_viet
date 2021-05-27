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
      "name": "Hanoi Emotion Hotel",
      "location": "26-28 Ngõ Hàng Bột, Cát Linh, Đống Đa, Hà Nội",
      "rating": 3.9,
      "rating_count": 3802,
      "image":
          "https://media.expedia.com/hotels/5000000/4170000/4167700/4167651/7754801f_z.jpg",
    },
    {
      "name": "Grand Mercure Hanoi",
      "location": "9 Cát Linh, Quốc Tử Giám, Đống Đa, Hà Nội 100000",
      "rating": 4.7,
      "rating_count": 9,
      "image":
          "https://cf.bstatic.com/images/hotel/max1024x768/252/252017308.jpg"
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
