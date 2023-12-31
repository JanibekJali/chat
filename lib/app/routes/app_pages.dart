import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/phone_otp/bindings/phone_otp_binding.dart';
import '../modules/phone_otp/views/phone_otp_view.dart';
import '../modules/phone_verification/bindings/phone_verification_binding.dart';
import '../modules/phone_verification/views/phone_verification_view.dart';
import '../modules/redirect/bindings/redirect_binding.dart';
import '../modules/redirect/views/redirect_view.dart';
import '../modules/walkthrough/bindings/walkthrough_binding.dart';
import '../modules/walkthrough/views/walkthrough_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.REDIRECT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WALKTHROUGH,
      page: () => const WalkthroughView(),
      binding: WalkthroughBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_VERIFICATION,
      page: () => PhoneVerificationView(),
      binding: PhoneVerificationBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_OTP,
      page: () => const PhoneOtpView(),
      binding: PhoneOtpBinding(),
    ),
    GetPage(
      name: _Paths.REDIRECT,
      page: () => RedirectView(),
      binding: RedirectBinding(),
    ),
  ];
}
