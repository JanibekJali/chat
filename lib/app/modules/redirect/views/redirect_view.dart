import 'package:chat/app/modules/authentication/authentication.dart';
import 'package:chat/app/modules/home/views/home_view.dart';
import 'package:chat/app/modules/phone_verification/views/phone_verification_view.dart';
import 'package:chat/widgets/progress/progress_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/redirect_controller.dart';

class RedirectView extends StatelessWidget {
  final _authCont = AuthenticationController.findAuthCont;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (_authCont.state is AuthenticationLoadingState) {
          return Scaffold(
            body: Center(
              child: circularProgress(),
            ),
          );
        } else if (_authCont.state is UnAuthenticatedState) {
          return PhoneVerificationView();
        } else if (_authCont.state is AuthenticatedUserState) {
          return const HomeView();
        }

        /* if circular is not entered then second circular will be working */
        return const Scaffold(
          body: Center(
            child: Text('Someting went wrong! Please try again!'),
          ),
        );
      },
    );
  }
  // void _build(AuthenticationState state){
  //   switch (state) {
  //     case AuthenticationLoadingState:

  //       break;
  //     default:
  //   }
  // }
}
