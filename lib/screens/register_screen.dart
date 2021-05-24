import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_pickers/country.dart';

import '../styles.dart';
import '../widgets/default_sized_box.dart';
import '../icon_image_path.dart';
import '../app_strings.dart';
import '../widgets/default_text_form_field.dart';
import '../widgets/default_padding.dart';
import '../utils/input_validations_utils.dart';
import '../widgets/country_picker/country_picker.dart';
import '../widgets/default_date_picker.dart';
import '../widgets/default_button.dart';
import '../widgets/default_drop_down.dart';
import '../constants/app_constants.dart';
import '../widgets/error_hint_text.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final double inputVerticalSpacing = 20;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? selectedYourCountry;
  String? selectedCountryCode;
  DateTime? dateOfBirth;
  String? gender;

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  bool isYourCountryError = false;
  bool isCountryCodeError = false;
  bool isDateOfBirthError = false;

  @override
  void dispose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    dobController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Styles.whiteColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DefaultSizedBox.vertical(15),
                Image.asset(
                  AppImages.smallLogo,
                  width: 167.w,
                  height: 54.h,
                  fit: BoxFit.contain,
                ),
                DefaultSizedBox.vertical(35),
                _buildTitleSection(),
                DefaultSizedBox.vertical(55),
                _buildRegistrationForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      children: [
        Text(
          AppStrings.userRegistration.tr(),
          style: TextStyle(
            fontWeight: Styles.boldText,
            fontSize: 23.sp,
            color: Styles.primaryColor,
          ),
        ),
        DefaultSizedBox.vertical(5),
        Text(
          AppStrings.userRegistrationInfoText.tr(),
          style: TextStyle(
            fontSize: Styles.regularFontSize,
            color: Styles.primaryDarkColor,
          ),
        ),
      ],
    );
  }

  Widget _buildRegistrationForm() {
    return Form(
      key: _formKey,
      child: DefaultPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CountryPicker(
              onValueChanged: (Country country) {
                setState(() {
                  selectedYourCountry = country.name;
                  isYourCountryError = false;
                });
              },
              value: selectedYourCountry,
              hasError: isYourCountryError,
            ),
            if (isYourCountryError) ErrorHintText(),
            DefaultSizedBox.vertical(inputVerticalSpacing - 10),
            DefaultTextFormField(
              hintText: AppStrings.fullName.tr(),
              controller: fullNameController,
              validator: InputValidationsUtils.validateEmptyString,
            ),
            DefaultSizedBox.vertical(15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 13.h),
                      child: CountryPicker.phoneCode(
                        onValueChanged: (Country country) {
                          setState(() {
                            selectedCountryCode = '+${country.phoneCode}';
                            isCountryCodeError = false;
                          });
                        },
                        value: selectedCountryCode,
                        hasError: isCountryCodeError,
                      ),
                    ),
                    if (isCountryCodeError) ErrorHintText(),
                  ],
                )),
                DefaultSizedBox.horizontal(15),
                Flexible(
                  flex: 2,
                  child: DefaultTextFormField(
                    hintText: AppStrings.phoneNumber,
                    controller: phoneNumberController,
                    validator: InputValidationsUtils.validateEmptyString,
                  ),
                ),
              ],
            ),
            DefaultSizedBox.vertical(10),
            DefaultTextFormField(
              hintText: AppStrings.email.tr(),
              controller: emailController,
              validator: InputValidationsUtils.validateEmail,
            ),
            DefaultSizedBox.vertical(15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: DefaultDatePicker(
                          onDateSelected: (DateTime? date) {
                            dateOfBirth = date;
                            setState(() {
                              isDateOfBirthError = false;
                            });
                          },
                          value: dateOfBirth,
                          hasError: isDateOfBirthError,
                        ),
                      ),
                      if (isDateOfBirthError) ErrorHintText(),
                    ],
                  ),
                ),
                DefaultSizedBox.horizontal(15),
                Flexible(
                  child: DefaultDropdown(
                    hintText: AppStrings.gender.tr(),
                    items: kGender
                        .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                              child: Text('${e.tr()}'),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        gender = val as String;
                      });
                    },
                    validator: InputValidationsUtils.validateEmptyString,
                  ),
                ),
              ],
            ),
            DefaultSizedBox.vertical(inputVerticalSpacing),
            DefaultTextFormField(
              hintText: AppStrings.password.tr(),
              controller: passwordController,
              obscureText: obscurePassword,
              shouldShowVisiblity: true,
              onVisibilityTap: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
              validator: InputValidationsUtils.validateEmptyString,
            ),
            DefaultSizedBox.vertical(inputVerticalSpacing),
            DefaultTextFormField(
              hintText: AppStrings.confirmPassword.tr(),
              controller: confirmPasswordController,
              obscureText: obscureConfirmPassword,
              shouldShowVisiblity: true,
              onVisibilityTap: () {
                setState(() {
                  obscureConfirmPassword = !obscureConfirmPassword;
                });
              },
              validator: (val) => InputValidationsUtils.validateConfirmPassword(
                val,
                passwordController.text.trim(),
              ),
            ),
            DefaultSizedBox.vertical(55),
            Align(
              alignment: Alignment.center,
              child: DefaultButton(
                width: 213.w,
                buttonText: AppStrings.register,
                onPressed: () {
                  otherFieldsHasError();
                  bool checking1 = _formKey.currentState!.validate();
                  bool checking2 = otherFieldsHasError();

                  if (!checking1 || checking2) return;
                },
              ),
            ),
            DefaultSizedBox.vertical(35),
          ],
        ),
      ),
    );
  }

  bool otherFieldsHasError() {
    int otherErrorCount = 0;

    if (selectedYourCountry == null) {
      isYourCountryError = true;
      otherErrorCount++;
    } else {
      isYourCountryError = false;
    }

    if (selectedCountryCode == null) {
      isCountryCodeError = true;
      otherErrorCount++;
    } else {
      isCountryCodeError = false;
    }

    if (dateOfBirth == null) {
      isDateOfBirthError = true;
      otherErrorCount++;
    } else {
      isDateOfBirthError = false;
    }

    setState(() {});

    return otherErrorCount > 0;
  }
}
