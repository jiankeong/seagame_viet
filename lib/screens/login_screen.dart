import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../icon_image_path.dart';
import '../widgets/default_padding.dart';
import '../widgets/default_sized_box.dart';
import '../widgets/splash_login_shared/splash_login_footer.dart';
import '../widgets/splash_login_shared/splash_login_logo.dart';
import '../app_strings.dart';
import '../styles.dart';
import '../widgets/default_text_form_field.dart';
import '../widgets/default_button.dart';
import '../widgets/default_divider.dart';
import '../widgets/text_pressable.dart';
import '../utils/input_validations_utils.dart';
import '../utils/build_dialog.dart';
import './participant_country_screen.dart';
import './register_screen.dart';
import './home_screen_stack.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/Login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.loginBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: DefaultPadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DefaultSizedBox.vertical(35),
                    Column(
                      children: [
                        SplashLoginLogo(
                          logoSize: 136,
                          textFontSize: 23,
                          leftPadding: 8,
                        ),
                        DefaultSizedBox.vertical(8),
                        _buildLoginInfoText(),
                        DefaultSizedBox.vertical(35),
                        _buildLoginForm(),
                        DefaultSizedBox.vertical(35),
                        DefaultDivider(),
                        DefaultSizedBox.vertical(15),
                        _buildDoNotHaveAccountSection(),
                        DefaultSizedBox.vertical(18),
                        _buildLanguageSection(),
                        DefaultSizedBox.vertical(35),
                        SplashLoginFooter(
                          termsOnPressed: () {
                            buildTermsOrPrivacyDialog(context);
                          },
                          privacyPolicyOnPressed: () {
                            buildTermsOrPrivacyDialog(
                              context,
                              type: 1,
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginInfoText() {
    return Text(
      AppStrings.loginInfoText.tr(),
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: Styles.regularFontSize,
          fontWeight: Styles.boldText,
          color: Styles.primaryDarkColor),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          DefaultTextFormField(
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 15.w,
              ),
              child: Image.asset(
                AppIcons.smallProfileAvatarRounded,
                width: 28.h,
                height: 28.h,
                fit: BoxFit.contain,
              ),
            ),
            hintText: AppStrings.emailOrPhoneNumber.tr().toUpperCase(),
            controller: _usernameController,
            validator: InputValidationsUtils.validateEmptyString,
          ),
          DefaultSizedBox.vertical(15),
          DefaultTextFormField(
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 15.w,
              ),
              child: Image.asset(
                AppIcons.lock,
                width: 28.h,
                height: 28.5.h,
                fit: BoxFit.contain,
              ),
            ),
            hintText: AppStrings.password.tr().toUpperCase(),
            controller: _passwordController,
            obscureText: true,
            validator: InputValidationsUtils.validateEmptyString,
          ),
          DefaultSizedBox.vertical(55),
          DefaultButton(
            buttonText: AppStrings.login,
            width: 185.w,
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;

              Navigator.pushReplacementNamed(
                context,
                ParticipantCountryScreen.routeName,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDoNotHaveAccountSection() {
    return Column(
      children: [
        Text(
          '${AppStrings.doNotHaveAnAccount.tr().toUpperCase()}?',
          style: TextStyle(
            color: Styles.primaryDarkColor,
            fontSize: Styles.smallerRegularSize,
          ),
        ),
        DefaultSizedBox.vertical(15),
        Row(
          children: [
            Flexible(
              child: DefaultButton(
                width: double.infinity,
                color: Styles.primaryDarkColor,
                buttonText: AppStrings.joinNow,
                onPressed: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                },
              ),
            ),
            DefaultSizedBox.horizontal(10),
            Flexible(
              child: DefaultButton(
                width: double.infinity,
                color: Styles.whiteColor,
                fontColor: Styles.primaryColor,
                buttonText: AppStrings.guestLogin,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreenStack.routeName);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLanguageSection() {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextPressable(
            label: 'English',
            fontSize: Styles.smallerTitleFontSize,
            onPressed: () {
              changeLanguage('en');
            },
          ),
          DefaultDivider.vertical(),
          TextPressable(
            label: '中文',
            fontSize: Styles.smallerTitleFontSize,
            onPressed: () {
              changeLanguage('zh');
            },
          ),
          DefaultDivider.vertical(),
          TextPressable(
            label: 'Tiếng Việt',
            fontSize: Styles.smallerTitleFontSize,
            onPressed: () {
              changeLanguage('vi');
            },
          ),
        ],
      ),
    );
  }

  void changeLanguage(String locale) {
    context.setLocale(Locale(locale));
  }
}
