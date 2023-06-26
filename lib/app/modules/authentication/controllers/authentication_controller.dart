import 'dart:developer';

import 'package:chat/app/data/services/firebase_auth/firebase_auth_services.dart';
import 'package:chat/app/models/user/user_model.dart';
import 'package:chat/app/modules/authentication/authentication_service.dart';
import 'package:chat/app/modules/phone_verification/views/phone_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../authentication.dart';

class AuthenticationController extends GetxController {
  /* Get.find() - bir jerde jurgon bolso kalgan ubakta jurguzboi ele tabip alip mintip jurguzo ber */
  static final AuthenticationController findAuthCont = Get.find();
  final AuthenticationService _authenticationService;
  /*
  this - syrttan neni jibersen dagy klasstyn ichindegi 
  variablega (oshogo) beresin
  final AuthenticationService _authenticationService; - ushugan koz karady kilip koiduk
   _authenticationService menen chogu ishteisin jalgyz ishtei albaisyn - DI
   */
  AuthenticationController(this._authenticationService);
  /* RX - jonokoidon Rxke -
   obs - kachan ozgoruu bolgondo sirttan ugup tursun*/
  final Rx<AuthenticationState> _authState = AuthenticationState().obs;
  final Rx<UserModel> _userModel = UserModel().obs;

  AuthenticationState get state => _authState.value;
  UserModel get getCurrentUser => _userModel.value;

  RxBool isCreatingUser = false.obs;

  RxString verificationId = ''.obs;

  // getAuthenticatedUser () => _getAuthenticatedUser();
  /* 
  onInit - ushul class chakirylganda 
   birinchi usul function ishteit
  */
  @override
  void onInit() {
    log('AuthenticationController worked!');
    _getAuthenticatedUser();
    super.onInit();
  }

  void _getAuthenticatedUser() async {
    _authState.value = AuthenticationLoadingState();
    log('_authState.value: ${_authState.value}');

    // final _user = await _authenticationService.getCurrentUser();
    final _user = null;
    // log('_user.id ==>> ${_user.userID}');
    if (_user == null || _user == UserModel()) {
      _authState.value = UnAuthenticatedState();
      log('user jok -> _authState.value: ${_authState.value}');
    } else {
      _authState.value = AuthenticatedUserState(_user);
      log('user bar ->  _authState.value: ${_authState.value}');
      // _userModel.value = _user;
    }
  }

  Future<void> verifyPhoneNumber({String? phoneNumber}) async {
    await firebaseAuthServices!.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      // isSignIn: isSignIn!,
    );
    if (verificationId.value.isNotEmpty) {
      log('verificationId.value: ${verificationId.value}');
      Get.to(() => PhoneOtp(code: phoneNumber!));
    }
  }

  Future<void> sendSmsCode({String? smsCode}) async {
    final _userCred = await firebaseAuthServices!.validateOtp(smsCode!);
  }
}
