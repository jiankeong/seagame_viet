import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/default_app_bar.dart';
import '../icon_image_path.dart';
import '../widgets/default_cache_network_image.dart';
import '../globals.dart';
import '../widgets/default_sized_box.dart';
import '../widgets/default_padding.dart';
import '../styles.dart';
import '../utils/date_format_utils.dart';

class NewsDetailScreen extends StatelessWidget {
  static const routeName = '/NewsDetail';

  final Map<String, dynamic> info = {
    "title": "Lee smashing through the quaterfinals with straight wins",
    "author": "Colin Ward-Henninger",
    "date": "2021-05-12 00:00:00",
    "content": """
      While agreeing with talks that the Thomas and Uber Cup Finals in Aarhus, Denmark on Oct 3-11 should be postponed, the former World No 1 is against the idea of having to bow to sponsors' demands.

      It's believed the sponsors of the Thomas/Uber Cup want the presences of top teams or else the events are postponed. Big guns Indonesia and South Korea have announced their withdrawals.

      Chong Wei told Timesport yesterday: "These are uncertain times that we are experiencing. Nobody wants this. I'm almost 40 and I never thought I'd experience something like this Covid-19 pandemic.

      "As a former athlete, I feel the Thomas and Uber Cups should not go on. I wouldn't want to play in it surely. However, postponing it due to mainly commercial interest is wrong. That is very selfish of BWF.

      "As the world governing body, their top priority should be the players, not their own pockets."

      BWF are expected to postpone the world team events for the third time. Originally, the Thomas and Uber Cup Finals were scheduled for May 16-24, before it was moved to Aug 15-23 and then to Oct 3-11.

      Several former internationals, including the great Morten Frost, and 1992 world junior champion, Jim Laugesen, believe the events should go on, despite the withdrawals as Badminton Denmark have worked hard to ensure a safe environment for all players, officials and even fans.

      Frost and Laugesen also feel that international badminton should resume soon and not have a prolonged lapse.

      Chong Wei, however, feels otherwise. "I understand where these former players are coming from but we cannot compare badminton with some of the other sports that have resumed.

      "In England, the EPL has resumed and in Italy the Serie A and so on. But they are only traveling within their countries.

      "Of course in Europe, the border control policies are different from ours.

      "Having said that, the risk of contracting Covid-19 is still very high. It's just too risky. BWF should postpone the Thomas and Uber Cup Finals, but it should be for the right reasons."

      On when he expects sports to be played full scale again, Chong Wei, who has won the Olympic silver three times, said: "It's really difficult to say right now. I know players are eager to get back on court again. It's their livelihoods at stake.

      "However, health and safety always come first. Hopefully in the next couple of months, the situation will improve.""",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            trailing: InkWell(
              onTap: () {
                Share.share(info['title']);
              },
              child: Image.asset(
                AppIcons.share,
                width: 28.h,
                height: 28.h,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DefaultCacheNetworkImage(
                    width: double.infinity,
                    height: Globals().getScreenHeight() * 0.35,
                    imageUrl:
                        'https://cms.bwfbadminton.com/wp-content/uploads/2018/04/finals_Lee-Chong-Wei.jpg',
                  ),
                  DefaultSizedBox.vertical(20),
                  DefaultPadding(
                    child: Column(
                      children: [
                        Text(
                          info['title'],
                          style: TextStyle(
                            color: Styles.primaryColor,
                            fontSize: 32.sp,
                            fontWeight: Styles.boldText,
                          ),
                        ),
                        DefaultSizedBox.vertical(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'By ',
                                  style: TextStyle(
                                    color: Styles.suvaGrey,
                                    fontSize: Styles.regularFontSize,
                                  ),
                                ),
                                Text(info['author'],
                                    style: TextStyle(
                                        fontSize: Styles.regularFontSize,
                                        color: Styles.primaryDarkColor,
                                        fontWeight: Styles.boldText))
                              ],
                            ),
                            DefaultSizedBox.horizontal(10),
                            Text(
                              '${DateFormatUtils.ddMMMyyyFormat1(DateTime.parse(info['date']))}',
                              style: TextStyle(
                                color: Styles.suvaGrey,
                                fontSize: Styles.regularFontSize,
                              ),
                            )
                          ],
                        ),
                        DefaultSizedBox.vertical(20),
                        Text(
                          info['content'],
                          style: TextStyle(
                            fontSize: Styles.regularFontSize,
                          ),
                        ),
                        DefaultSizedBox.vertical(15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
