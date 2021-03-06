import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_code_lesson_2/constants/app_assets.dart';
import 'package:simple_code_lesson_2/constants/app_colors.dart';
import 'package:simple_code_lesson_2/constants/app_styles.dart';
import 'package:simple_code_lesson_2/generated/l10n.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.onSaved,
    required this.obscureText,
    required this.onPressed,
  }) : super(key: key);

  final Function(String?)? onSaved;
  final bool obscureText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.s16w400.copyWith(
        color: AppColors.mainText,
      ),
      obscureText: obscureText,
      obscuringCharacter: '・',
      decoration: InputDecoration(
        hintText: S.of(context).password,
        hintStyle: AppStyles.s16w400.copyWith(
          color: AppColors.neutral4,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SvgPicture.asset(
            AppAssets.svg.password,
            width: 16.0,
            color: AppColors.neutral4,
          ),
        ),
        suffixIcon: IconButton(
          splashRadius: 8.0,
          icon: const Icon(Icons.visibility),
          onPressed: onPressed,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        filled: true,
        fillColor: AppColors.neutral1,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide.none,
        ),
        counterText: '',
      ),
      maxLength: 16,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return S.of(context).inputErrorCheckPassword;
        }
        if (value.length < 8) {
          return S.of(context).inputErrorPasswordIsShort;
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
