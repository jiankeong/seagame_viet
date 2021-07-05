import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../widgets/default_sized_box.dart';
import '../utils/general_functions.dart';
import '../styles.dart';
import './product_detail_screen.dart';

class EShopScreen extends StatelessWidget {
  static const routeName = '/EShop';

  final List<Product> _products = [
    Product(
      id: 1,
      image:
          "https://media2.bulgari.com/f_auto,q_auto/production/dwee8488f3/images/images/457496.png",
      price: 19,
      productName: "Memento Pendant",
      description:
          "15cm ring bronze coated, same design with the prize award to the participant",
    ),
    Product(
        id: 2,
        image:
            "https://thermosmalaysia.com/wp-content/uploads/2018/10/JNL-503PPL.png",
        price: 20,
        productName: "Sea Games 2021 Thermos Limited Edition",
        description:
            "350ml thermos, limited edition for SEA Games 2021, available for different colors"),
    Product(
        id: 3,
        image:
            "https://a1.bbkz.net/forum/attachment.php?attachmentid=3051915&thumb=1&d=1580378846",
        price: 5,
        productName: "Postcard",
        description:
            "SEA Games 2021 Limited Edition postcard, have 10 different types of design"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            title: AppStrings.eshop.tr(),
          ),
          Expanded(
              child: GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.78,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Product product = _products[index];

              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ProductDetailScreen.routeName);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: CachedNetworkImage(
                        imageUrl: product.image!,
                        width: 186.w,
                        height: 188.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    DefaultSizedBox.vertical(15),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 38.h,
                            child: Text(
                              product.productName!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: Styles.boldText,
                                  fontSize: Styles.regularFontSize),
                            ),
                          ),
                          Text(
                            '${formatNumToCurrency(
                              product.price!, decimalPlaces: 2
                            )} BHD',
                            style: TextStyle(
                                fontSize: Styles.smallerRegularSize,
                                fontWeight: Styles.boldText,
                                color: Styles.suvaGrey),
                          ),
                          DefaultSizedBox.vertical(5),
                          Text(
                            product.description!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: Styles.fontSize10),
                          ),
                          DefaultSizedBox.vertical(10),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: _products.length,
          )),
        ],
      ),
    );
  }
}

class Product {
  int? id;
  int? price;
  String? image;
  String? productName;
  String? description;

  Product({
    this.id,
    this.price,
    this.image,
    this.productName,
    this.description,
  });
}
