import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/phone_otp_controller.dart';

class PhoneOtpView extends GetView<PhoneOtpController> {
  const PhoneOtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhoneOtpView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PhoneOtpView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
