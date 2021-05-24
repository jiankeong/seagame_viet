import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/enums.dart';
import '../icon_image_path.dart';
import '../styles.dart';

class ProfileAvatar extends StatefulWidget {
  final String? profileImgUrl;
  final double radius;
  final ImageType imageType;
  final bool canEdit;

  const ProfileAvatar({
    required this.profileImgUrl,
    this.radius = 30,
    this.imageType = ImageType.network,
    this.canEdit = false,
  });

  @override
  _ProfileAvatarState createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  final ScreenUtil su = ScreenUtil();

  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          backgroundImage: hasError || widget.profileImgUrl == null
              ? AssetImage(AppImages.defaultProfileAvatarRounded)
              : widget.imageType == ImageType.network
                  // ignore: unnecessary_cast
                  ? NetworkImage(widget.profileImgUrl!) as ImageProvider
                  : widget.imageType == ImageType.asset
                      ? AssetImage(widget.profileImgUrl!) as ImageProvider
                      : FileImage(File(widget.profileImgUrl!)),
          onBackgroundImageError: (_, st) {
            setState(() {
              hasError = true;
            });
          },
          radius: widget.radius.h,
        ),
        if (widget.canEdit)
          Positioned(
            bottom: -1.0,
            right: -1.0,
            child: Container(
              padding: EdgeInsets.all(3.h),
              decoration: BoxDecoration(
                color: Styles.primaryColor,
                borderRadius: BorderRadius.circular(10.h),
              ),
              child: Icon(
                Icons.edit,
                size: 14.h,
                color: Styles.whiteColor,
              ),
            ),
          ),
      ],
    );
  }
}
