import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_circular_progress_indicator.dart';
import '../icon_image_path.dart';

class DefaultCacheNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final BoxFit boxFit;

  DefaultCacheNetworkImage({
    this.imageUrl,
    this.height,
    this.width,
    this.borderRadius,
    this.boxFit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      height: height,
      width: width,
      fit: boxFit,
      placeholder: (context, url) => Container(
        transform: Matrix4.translationValues(0, 0, 0),
        child: Container(
            width: ScreenUtil().setWidth(60),
            height: ScreenUtil().setWidth(80),
            child: Center(child: new CustomCircularProgressIndicator())),
      ),
      errorWidget: (context, url, error) => new Image.asset(
        AppImages.blankImage,
        height: height,
        width: width,
        fit: boxFit,
      ),
    );
  }
}
