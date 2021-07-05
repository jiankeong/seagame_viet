import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_games_gms/widgets/default_sized_box.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../constants/app_constants.dart';
import '../styles.dart';
import '../widgets/default_carousel.dart';
import '../globals.dart';
import '../widgets/default_cache_network_image.dart';
import './e_shop_screen.dart';
import '../widgets/default_padding.dart';
import '../utils/general_functions.dart';
import '../widgets/default_divider.dart';
import '../widgets/custom_shadow_container.dart';
import '../widgets/oval_button.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/ProductDetail';

  final List<String> productImage = [
    'https://media2.bulgari.com/f_auto,q_auto/production/dwee8488f3/images/images/457496.png',
  ];

  final Product product = Product(
    id: 1,
    price: 19,
    productName: "Memento Pendant",
    description:
        "15cm ring bronze coated, same design with the prize award to the participant",
  );

  final List<String> relatedProductImage = [
    'https://a1.bbkz.net/forum/attachment.php?attachmentid=3051915&thumb=1&d=1580378846',
    'https://thermosmalaysia.com/wp-content/uploads/2018/10/JNL-503PPL.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.whiteColor,
      body: Column(
        children: [
          DefaultAppBar(
            title: AppStrings.eshop.tr(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultCarousel(
                    height: Globals().getScreenHeight() * 0.3,
                    viewPortFraction: 1,
                    itemBuilder: (ctx, index, realIdx) {
                      return DefaultCacheNetworkImage(
                        imageUrl: productImage[index],
                      );
                    },
                    itemCount: productImage.length,
                  ),
                  DefaultSizedBox.vertical(15),
                  Container(
                    child: DefaultPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.productName!,
                            style: TextStyle(
                              fontSize: Styles.smallerTitleFontSize,
                              fontWeight: Styles.boldText,
                            ),
                          ),
                          DefaultSizedBox.vertical(10),
                          Row(
                            children: [
                              RatingBar.builder(
                                initialRating: 4,
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemSize: 15.h,
                                ignoreGestures: true,
                                itemPadding: EdgeInsets.symmetric(
                                  horizontal: 3.0.w,
                                ),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.black,
                                ),
                                onRatingUpdate: (selectedRating) {},
                              ),
                              DefaultSizedBox.horizontal(10),
                              Text(
                                '7 ${AppStrings.reviews.tr()}',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                ),
                              )
                            ],
                          ),
                          DefaultSizedBox.vertical(10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${formatNumToCurrency(
                                            20,
                                          )} BHD',
                                          style: TextStyle(
                                              fontSize: Styles.fontSize10,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        Text(
                                          '10% Off',
                                          style: TextStyle(
                                              fontSize: Styles.regularFontSize,
                                              color: Styles.offerColor),
                                        )
                                      ],
                                    ),
                                    DefaultSizedBox.horizontal(15),
                                    Text(
                                      '${formatNumToCurrency(
                                        product.price!,
                                      )} BHD',
                                      style: TextStyle(
                                        fontSize: Styles.regularFontSize,
                                      ),
                                    )
                                  ]),
                              DefaultSizedBox.horizontal(15),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 3.h,
                                  horizontal: 15.w,
                                ),
                                decoration: BoxDecoration(
                                  color: Styles.grey65,
                                  borderRadius: BorderRadius.circular(25.h),
                                ),
                                child: Text(
                                  AppStrings.inclusiveOfTax.tr(),
                                  style: TextStyle(
                                    fontSize: Styles.fontSize10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  DefaultSizedBox.vertical(25),
                  DefaultDivider(
                    thickness: 1.0.h,
                  ),
                  CustomShadowContainer(
                    topPadding: 20,
                    bottomPadding: 20,
                    roundedCorner: false,
                    child: DefaultPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.productInfo.tr(),
                            style: TextStyle(
                              fontSize: Styles.smallerTitleFontSize,
                              fontWeight: Styles.boldText,
                            ),
                          ),
                          DefaultSizedBox.vertical(15),
                          Text(
                            product.description!,
                            style: TextStyle(
                              fontSize: Styles.regularFontSize,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  DefaultSizedBox.vertical(30),
                  DefaultPadding(
                    child: Text(
                      AppStrings.relatedProduct.tr(),
                      style: TextStyle(
                        fontSize: Styles.smallerTitleFontSize,
                        fontWeight: Styles.boldText,
                      ),
                    ),
                  ),
                  DefaultSizedBox.vertical(10),
                  Container(
                    height: 110.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            if (index == 0)
                              DefaultSizedBox.horizontal(
                                  kDefaultScreenHorizontalPadding),
                            DefaultCacheNetworkImage(
                              imageUrl: relatedProductImage[index],
                              height: 105.h,
                              width: 105.h,
                            ),
                            DefaultSizedBox.horizontal(
                              index < relatedProductImage.length - 1
                                  ? 10.w
                                  : kDefaultScreenHorizontalPadding.w,
                            )
                          ],
                        );
                      },
                      itemCount: relatedProductImage.length,
                    ),
                  ),
                  DefaultSizedBox.vertical(25),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
              kDefaultScreenHorizontalPadding.w,
              15.h,
              kDefaultScreenHorizontalPadding.w,
              25.h,
            ),
            decoration: BoxDecoration(color: Styles.whiteSmoke, boxShadow: [
              BoxShadow(
                color: Styles.blackColor.withOpacity(0.2),
                offset: Offset(0, -1),
                spreadRadius: 0.3,
                blurRadius: 5,
              ),
            ]),
            child: Row(
              children: [
                OvalButton(
                  buttonText: AppStrings.purchase.tr(),
                  width: 115.w,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
