import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../icon_image_path.dart';
import '../styles.dart';
import '../widgets/default_sized_box.dart';
import '../providers/user_provider.dart';
import '../widgets/accrediation_ticket_layout.dart';
import '../models/user.dart';
import '../screens/qr_code_scanner_screen.dart';
import '../utils/build_bottom_sheet.dart';
import '../widgets/activation_bottom_sheet_layout.dart';

class MyTicketsScreen extends StatefulWidget {
  static const routeName = '/MyTickets';

  @override
  _MyTicketsScreenState createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends State<MyTicketsScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(AppImages.homeScreenStackBg),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              DefaultAppBar(
                title: AppStrings.accreditation.tr(),
                trailing: userProvider.user != null &&
                            userProvider.user!.userType! == 0 ||
                        userProvider.user!.userType! == 2
                    ? Consumer<UserProvider>(
                        builder: (context, userProvider, child) {
                          return InkWell(
                            onTap: scanQrCode,
                            child: Icon(
                              Icons.qr_code_scanner_outlined,
                              color: Styles.whiteColor,
                              size: 27.h,
                            ),
                          );
                        },
                      )
                    : null,
              ),
              DefaultSizedBox.vertical(15),
              Consumer<UserProvider>(
                builder: (context, userProvider, child) {
                  User? user = userProvider.user;

                  return AccrediationTicketLayout(user: user);
                },
              ),
              DefaultSizedBox.vertical(15),
            ],
          ),
        ),
      ),
    );
  }

  void scanQrCode() async {
    final res =
        await Navigator.pushNamed(context, QRCodeScannerScreen.routeName);

    if (res == null) return;

    await buildBottomSheet(context, ActivationBottomSheetLayout(),
        heightScale: 0.8);
  }
}
