import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_strings.dart';
import '../icon_image_path.dart';
import '../widgets/default_button.dart';
import '../widgets/default_sized_box.dart';
import '../styles.dart';
import '../widgets/default_padding.dart';
import '../widgets/country_flag_container.dart';

class ParticipantCountryScreen extends StatelessWidget {
  static const routeName = '/ParticipantCountry';

  final List<String> _participatingCountries = [
    AppImages.brunei,
    AppImages.laos,
    AppImages.indonesia,
    AppImages.cambodia,
    AppImages.malaysia,
    AppImages.myanmar,
    AppImages.philippines,
    AppImages.singapore,
    AppImages.thailand,
    AppImages.timorLeste
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.participantCountryBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: DefaultPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DefaultSizedBox.vertical(70),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Image.asset(
                    AppImages.logo,
                    width: 214.h,
                    height: 214.h,
                  ),
                ),
                DefaultSizedBox.vertical(35),
                Column(
                  children: [
                    _buildHostCountry(),
                    DefaultSizedBox.vertical(20),
                    _buildParticipatingCountriesGrid(),
                    DefaultSizedBox.vertical(35),
                    _buildInfoText(),
                    DefaultSizedBox.vertical(65),
                    _buildGetStartedButton(),
                    DefaultSizedBox.vertical(35),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHostCountry() {
    return Column(children: [
      Text(
        AppStrings.hostCountry.tr(),
        style: TextStyle(
            fontSize: Styles.smallerTitleFontSize,
            fontWeight: Styles.boldText,
            color: Styles.primaryColor),
      ),
      DefaultSizedBox.vertical(10),
      CountryFlagContainer(
        countryFlag: AppImages.vietnam,
      ),
    ]);
  }

  Widget _buildParticipatingCountriesGrid() {
    return Column(
      children: [
        Text(
          AppStrings.participatingCountries.tr(),
          style: TextStyle(
              fontSize: Styles.smallerTitleFontSize,
              fontWeight: Styles.boldText,
              color: Styles.primaryColor),
        ),
        DefaultSizedBox.vertical(20),
        Container(
          width: double.infinity,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.all(0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, childAspectRatio: 1.12),
            itemBuilder: (context, index) {
              return CountryFlagContainer(
                countryFlag: _participatingCountries[index],
              );
            },
            itemCount: _participatingCountries.length,
          ),
        )
      ],
    );
  }

  Widget _buildInfoText() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 35.w,
      ),
      child: Text(
        AppStrings.particiaptingCountriesInfoText.tr(),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: Styles.smallerTitleFontSize,
            fontWeight: Styles.boldText,
            color: Styles.primaryDarkColor),
      ),
    );
  }

  Widget _buildGetStartedButton() {
    return DefaultButton(
      buttonText: AppStrings.getStarted,
      width: 213.w,
    );
  }
}
