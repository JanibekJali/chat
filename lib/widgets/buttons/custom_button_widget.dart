import 'package:chat/app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.buttonText,
    required this.onTap,
    this.buttonTextStyle,
    this.buttonHor = 40,
    this.buttonVer = 10,
  }) : super(key: key);
  final String? buttonText;
  final double buttonHor;
  final double buttonVer;
  final TextStyle? buttonTextStyle;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: buttonHor,
            vertical: buttonVer,
          ),
          child: Text(
            buttonText!,
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
