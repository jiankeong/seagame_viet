import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../widgets/default_padding.dart';
import '../widgets/default_sized_box.dart';
import '../widgets/helpdesk/helpdesk_widgets.dart';

class HelpdeskScreen extends StatelessWidget {
  static const routeName = '/Helpdesk';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            title: AppStrings.helpdesk.tr(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      HelpdeskBanner(),
                      Expanded(
                        child: _buildFAQList(),
                      ),
                    ],
                  ),
                ),
                DefaultSizedBox.vertical(15),
                Padding(
                  padding: EdgeInsets.only(bottom: 25.h),
                  child: StartLiveChatButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQList() {
    return ListView(
      shrinkWrap: true,
      children: [
        DefaultPadding(
          child: FAQExpandable(
            faq: FAQ(
              question: 'How To Contact Us',
              answer:
                  'Address: 36 Tran Phu str., Ba Dinh dist., Hanoi, Vietnam',
            ),
          ),
        ),
      ],
    );
  }
}

class FAQ {
  String? question;
  String? answer;

  FAQ({this.question = '', this.answer = ''});
}
