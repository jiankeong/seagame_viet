import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../styles.dart';
import '../icon_image_path.dart';
import '../widgets/custom_future_builder.dart';
import '../widgets/default_smart_refresher.dart';
import '../utils/general_functions.dart';
import '../services/results_service.dart';
import '../widgets/custom_circular_progress_indicator.dart';
import '../widgets/match_container.dart';
import '../models/game_match.dart';
import '../widgets/default_sized_box.dart';
import '../utils/build_bottom_sheet.dart';
import '../widgets/results_list/filter_bottom_sheet_layout.dart';

class ResultListScreen extends StatefulWidget {
  static const routeName = '/ResultList';

  @override
  _ResultListScreenState createState() => _ResultListScreenState();
}

class _ResultListScreenState extends State<ResultListScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();

  bool isInit = true;
  bool isListInit = true;

  DateTime startingDate = DateTime.parse('2021-11-21 00:00:00');
  DateTime endingDate = DateTime.parse('2021-12-02 00:00:00');

  bool isLoading = false;

  List<GameMatch?> _matches = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (isInit) {
      if (DateTime.now().isBefore(startingDate) ||
          DateTime.now().isAfter(
            endingDate,
          )) {
        _selectedValue = startingDate;
      }

      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        moveToSelectionDelay();
      });
    }

    isInit = false;
  }

  Future<void> moveToSelectionDelay() async {
    await Future.delayed(Duration(seconds: 1));

    _controller.animateToSelection();
  }

  Future<dynamic> getMatches(
      {bool isRefresh = false, bool isLoadMore = false}) async {
    isListInit = false;
    final res = await ResultService.getMatchResultList();

    if (res == null) {
      _refreshController.refreshFailed();
      _refreshController.loadFailed();

      setState(() {
        isLoading = false;
      });
      return false;
    }

    final serializedRes = List<Map<String, dynamic>>.from(res['data']);

    if (isRefresh) {
      _matches.clear();
    }

    for (Map<String, dynamic> match in serializedRes) {
      _matches.add(GameMatch.fromJson(match));
    }

    if (isRefresh) {
      _refreshController.refreshCompleted();
    }

    if (isLoadMore) {
      _refreshController.loadComplete();
    }

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(),
          DefaultSizedBox.vertical(5),
          _buildDatePicker(),
          DefaultSizedBox.vertical(5),
          Expanded(
            child: CustomFutureBuilder(
              future: isListInit ? getMatches() : blankFunction(),
              successWidget: DefaultSmartRefresher(
                controller: _refreshController,
                enablePullDown: true,
                enablePullUp: true,
                onLoading: () {
                  getMatches(isLoadMore: true);
                },
                onRefresh: () {
                  getMatches(isRefresh: true);
                },
                child: isLoading
                    ? Center(
                        child: CustomCircularProgressIndicator(),
                      )
                    : _buildMatchList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return DefaultAppBar(
      title: AppStrings.result.tr(),
      trailing: _buildFilterButton(),
    );
  }

  Widget _buildFilterButton() {
    return InkWell(
      onTap: () async {
        final res = await buildBottomSheet(
          context,
          FilterBottomSheetLayout(),
          heightScale: 0.45,
        );

        if (res == null || (res['sport'] == null && res['discipline'] == null))
          return;
      },
      child: Container(
        padding: EdgeInsets.all(5.h),
        decoration: BoxDecoration(
          color: Styles.primaryDarkColor,
          borderRadius: BorderRadius.circular(5.h),
        ),
        child: Image.asset(
          AppIcons.filter,
          width: 24.w,
          height: 21.h,
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return Container(
      child: DatePicker(
        startingDate,
        daysCount: 14,
        controller: _controller,
        initialSelectedDate: _selectedValue,
        selectionColor: Styles.primaryColor,
        dayTextStyle: TextStyle(
          fontSize: Styles.smallerRegularSize,
        ),
        dateTextStyle: TextStyle(
          fontSize: 24.sp,
        ),
        monthTextStyle: TextStyle(
          fontSize: Styles.smallerRegularSize,
        ),
        onDateChange: (DateTime date) {
          setState(() {
            _selectedValue = date;
            isLoading = true;
          });

          getMatches(isRefresh: true);
        },
      ),
    );
  }

  Widget _buildMatchList() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        GameMatch? match = _matches[index];

        return Column(
          children: [
            InkWell(
              onTap: () {},
              child: MatchContainer(
                match: match,
              ),
            ),
            DefaultSizedBox.vertical(15),
          ],
        );
      },
      itemCount: _matches.length,
    );
  }
}
