import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../widgets/default_sized_box.dart';
import '../widgets/default_text_form_field.dart';
import '../utils/input_validations_utils.dart';
import '../widgets/default_padding.dart';
import '../widgets/default_button.dart';
import '../utils/build_toast.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const routeName = '/ChangePassword';

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool obscureCurrentPassword = true;
  bool obscureNewPassword = true;
  bool obscureConfirmNewPassword = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Column(
          children: [
            DefaultAppBar(
              title: AppStrings.changePassword.tr(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: DefaultPadding(
                  child: _buildForm(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          DefaultSizedBox.vertical(35),
          DefaultTextFormField(
            hintText: AppStrings.currentPassword.tr(),
            controller: _currentPasswordController,
            obscureText: obscureCurrentPassword,
            shouldShowVisiblity: true,
            onVisibilityTap: () {
              setState(() {
                obscureCurrentPassword = !obscureCurrentPassword;
              });
            },
            validator: InputValidationsUtils.validateEmptyString,
          ),
          DefaultSizedBox.vertical(65),
          DefaultTextFormField(
            hintText: AppStrings.newPasword.tr(),
            controller: _newPasswordController,
            obscureText: obscureNewPassword,
            shouldShowVisiblity: true,
            onVisibilityTap: () {
              setState(() {
                obscureNewPassword = !obscureNewPassword;
              });
            },
            validator: InputValidationsUtils.validateEmptyString,
          ),
          DefaultSizedBox.vertical(25),
          DefaultTextFormField(
            hintText: AppStrings.confirmNewPassowrd.tr(),
            controller: _confirmPasswordController,
            obscureText: obscureConfirmNewPassword,
            shouldShowVisiblity: true,
            onVisibilityTap: () {
              setState(() {
                obscureConfirmNewPassword = !obscureConfirmNewPassword;
              });
            },
            validator: (val) => InputValidationsUtils.validateConfirmPassword(
              val,
              _newPasswordController.text.trim(),
            ),
          ),
          DefaultSizedBox.vertical(85),
          _buildSubmitButton(),
          DefaultSizedBox.vertical(25),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return DefaultButton(
      width: double.infinity,
      buttonText: AppStrings.submit,
      onPressed: _submitButtonOnPressed,
    );
  }

  void _submitButtonOnPressed() {
    if(!_formKey.currentState!.validate()) return;

    buildToast1(AppStrings.updateSuccessfully);

    Navigator.pop(context);
  }
}
