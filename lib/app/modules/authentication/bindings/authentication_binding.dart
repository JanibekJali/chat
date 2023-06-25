import 'dart:developer';

import 'package:chat/app/modules/authentication/authentication_service.dart';
import 'package:get/get.dart';

import '../authentication.dart';

class AuthenticationBiding extends Bindings {
  @override
  void dependencies() {
    log('AuthenticationBiding worked!');
    Get.put<AuthenticationController>(
      AuthenticationController(Get.put(FirebaseAuthenticationService())),
      /* permanent - bul app ishtegen saiyn 
    AuthenticationController jalgyz boidon kalsyn oshol ele ishtesin
    ochposun ech jerde 
     */
      permanent: true,
    );
    // Get.put<AuthenticationController>(
    //     AuthenticationController(Get.put(ServerAuthenticationService())),
    //     permanent: true);
  }
}
