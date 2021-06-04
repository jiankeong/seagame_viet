import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_strings.dart';
import '../widgets/default_app_bar.dart';
import '../widgets/custom_future_builder.dart';
import '../styles.dart';
import '../widgets/default_padding.dart';
import '../utils/general_functions.dart';
import '../services/results_service.dart';
import '../widgets/default_smart_refresher.dart';
import '../utils/date_format_utils.dart';
import '../widgets/default_sized_box.dart';
import '../widgets/result_containers/result_containers.dart';
import '../widgets/default_cache_network_image.dart';
import '../globals.dart';
import '../widgets/no_records_found_text.dart';

class ResultDetailScreen extends StatefulWidget {
  static const routeName = '/ResultDetail';

  @override
  _ResultDetailScreenState createState() => _ResultDetailScreenState();
}

class _ResultDetailScreenState extends State<ResultDetailScreen> {
  final TextStyle smallInfoTextStyle = TextStyle(
    color: Styles.primaryColor,
    fontSize: Styles.smallerRegularSize,
    fontWeight: Styles.boldText,
  );

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  Map<String, dynamic>? matchResult;

  bool isInit = true;

  Future<dynamic> _getMatchResult() async {
    isInit = false;

    final res = await ResultService.getMatchResult();

    _refreshController.refreshCompleted();

    if (res == null) {
      setState(() {});

      return false;
    }

    matchResult = res;

    if (!mounted) return;

    setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.whiteColor,
      body: Column(
        children: [
          DefaultAppBar(
            title: AppStrings.results.tr(),
          ),
          Expanded(
              child: CustomFutureBuilder(
            future: isInit ? _getMatchResult() : blankFunction(),
            successWidget: DefaultSmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: false,
              onRefresh: () {
                _getMatchResult();
              },
              child: matchResult == null
                  ? Center(child: NoRecordFoundText(),)
                  : ListView(
                      children: [
                        _buildMatchInfoContainer(),
                        _buildResultsContainer(),
                      ],
                    ),
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildMatchInfoContainer() {

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 30.h,
      ),
      color: Styles.whiteSmoke,
      child: DefaultPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${DateFormatUtils.combineStartDateAndEndDate(
                DateTime.parse(matchResult!['start_time']),
                DateTime.parse(matchResult!['end_time']),
              )}',
              style: smallInfoTextStyle,
            ),
            DefaultSizedBox.vertical(3),
            Row(
              children: [
                Text(
                  matchResult!['location'],
                  style: smallInfoTextStyle,
                ),
                DefaultSizedBox.horizontal(5),
                Icon(
                  Icons.place,
                  size: 14.h,
                  color: Styles.primaryColor,
                ),
              ],
            ),
            DefaultSizedBox.vertical(20),
            Text(
              matchResult!['sport'],
              style: TextStyle(
                fontSize: Styles.smallerTitleFontSize,
                color: Styles.primaryDarkColor,
                fontWeight: Styles.boldText,
              ),
            ),
            DefaultSizedBox.vertical(5),
            Text(
              matchResult!['event'],
              style: TextStyle(
                color: Styles.primaryColor,
                fontSize: Styles.regularFontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsContainer() {
    List<String> imgUrl = matchResult!['galleries'];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.h),
      child: DefaultPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.results.tr(),
              style: TextStyle(
                fontSize: 21.sp,
                fontWeight: Styles.boldText,
                color: Styles.primaryColor,
              ),
            ),
            DefaultSizedBox.vertical(15),
            ScoreResultContainer(
              matchResult: matchResult,
            ),
            // TimingResultContainer(),
            DefaultSizedBox.vertical(30),
            Text(
              AppStrings.matchGallery.tr(),
              style: TextStyle(
                fontSize: 21.sp,
                fontWeight: Styles.boldText,
                color: Styles.primaryColor,
              ),
            ),
            DefaultSizedBox.vertical(20),
            Center(
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  for (String img in imgUrl)
                    DefaultCacheNetworkImage(
                      imageUrl: img,
                      width: Globals().getScreenWidth() * 0.4,
                      height: Globals().getScreenWidth() * 0.4,
                    ),
                ],
              ),
            ),
            DefaultSizedBox.vertical(25),
          ],
        ),
      ),
    );
  }
}
