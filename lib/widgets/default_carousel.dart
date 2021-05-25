import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';
// import '../globals.dart' as globals;

class DefaultCarousel extends StatefulWidget {
  final int itemCount;
  final double height;
  final Function itemBuilder;
  final double aspectRatio;
  final double viewPortFraction;
  final double indicatorRatio;
  final int initialPage;

  DefaultCarousel({
    this.height = 200,
    this.itemCount = 0,
    this.aspectRatio = 1.0,
    this.viewPortFraction = 1.0,
    required this.itemBuilder,
    this.indicatorRatio = 0.4,
    this.initialPage = 0,
  });

  @override
  _DefaultCarouselState createState() => _DefaultCarouselState();
}

class _DefaultCarouselState extends State<DefaultCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.itemCount,
          options: CarouselOptions(
              height: widget.height,
              viewportFraction: widget.viewPortFraction,
              aspectRatio: widget.aspectRatio,
              enableInfiniteScroll: false,
              enlargeCenterPage: false,
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }),
          itemBuilder: (ctx, index, realIdx) {
            return widget.itemBuilder(ctx, index, realIdx);
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(top: 10.h, right: 15.w),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
              decoration: BoxDecoration(
                color: Styles.blackColor.withOpacity(
                  0.5,
                ),
                borderRadius: BorderRadius.circular(15.h)
              ),
              child: Text(
                '${widget.itemCount == 0 ? 0 : _currentIndex + 1} / ${widget.itemCount}',
                style: TextStyle(
                  color: Styles.whiteColor,
                  fontWeight: Styles.regularText,
                  fontSize: Styles.smallerRegularSize
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
