import 'package:chat/app/constants/assets/app_assets.dart';
import 'package:chat/app/constants/text_styles/app_text_styles.dart';
import 'package:chat/app/modules/phone_verification/views/phone_verification_view.dart';
import 'package:chat/widgets/buttons/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/walkthrough_controller.dart';

class WalkthroughView extends GetView<WalkthroughController> {
  const WalkthroughView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppAssests.walkthrough(height: 220),
            Text(
              'Connect easily with your family and friends over countries',
              style: AppTextStyles.mulishBlack24w900,
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                Text(
                  'Terms & Privacy Policy',
                  style: AppTextStyles.mulishBlack14w600,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonWidget(
                  onTap: () {
                    Navigator.pushNamed(context, '/phone-verification');
                  },
                  buttonText: 'Start Messaging',
                  buttonTextStyle: AppTextStyles.mulishWhite16w700,
                  buttonHor: MediaQuery.of(context).size.width * 0.25,
                  buttonVer: MediaQuery.of(context).size.height * 0.025,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
