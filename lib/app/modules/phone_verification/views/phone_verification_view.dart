import 'dart:developer';

import 'package:chat/app/constants/colors/app_colors.dart';
import 'package:chat/app/constants/text_styles/app_text_styles.dart';
import 'package:chat/app/constants/widgets/app_constant_widgets.dart';
import 'package:chat/app/data/repos/local_data/local_repo_data.dart';
import 'package:chat/app/models/global/country_with_flags.dart';
import 'package:chat/widgets/buttons/custom_button_widget.dart';
import 'package:chat/widgets/inputs/key_board_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneVerificationView extends StatefulWidget {
  PhoneVerificationView({Key? key}) : super(key: key);

  @override
  State<PhoneVerificationView> createState() => _PhoneVerificationViewState();
}

class _PhoneVerificationViewState extends State<PhoneVerificationView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final controller = TextEditingController();

  String _usersPhoneNumber = '';
  List<DropdownMenuItem<CountryWithFlags>>? _dropdownMenuItems;
  CountryWithFlags? _selectedCountry;

  @override
  void initState() {
    _dropdownMenuItems = LocalDataRepo.buildDropDownMenuItems();
    _selectedCountry = _dropdownMenuItems![0].value;
    super.initState();
  }

  void _onKeyboardTap(String value) {
    // if KR phone number
    if (_selectedCountry!.phoneCode!.length == 4) {
      if (_usersPhoneNumber.length < 9) {
        _usersPhoneNumber = _usersPhoneNumber + value;
      }
    }
    // if RU phone number
    if (_selectedCountry!.phoneCode!.length == 2) {
      if (_usersPhoneNumber.length < 10) {
        _usersPhoneNumber = _usersPhoneNumber + value;
      }
    }
    // if TR phone number
    if (_selectedCountry!.phoneCode!.length == 3) {
      if (_usersPhoneNumber.length < 10) {
        _usersPhoneNumber = _usersPhoneNumber + value;
      }
    }
    setState(() {});
    log('_usersPhoneNumber: $_usersPhoneNumber');
  }

  Widget _phoneContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 45,
          width: MediaQuery.of(context).size.width * 0.25,
          decoration: BoxDecoration(
            color: AppColors.mainColor.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(2),
            ),
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(2.0),
              child: DropdownButton<CountryWithFlags>(
                underline: AppConstantWidget.emptyWidget,
                icon: AppConstantWidget.emptyWidget,
                value: _selectedCountry,
                items: _dropdownMenuItems,
                onChanged: (CountryWithFlags? value) {
                  setState(() {
                    _selectedCountry = value;
                  });
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 45,
          width: MediaQuery.of(context).size.width * 0.65,
          decoration: BoxDecoration(
            color: AppColors.mainColor.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(2),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  _usersPhoneNumber == '' ? 'Phone number' : _usersPhoneNumber,
                  style: AppTextStyles.mulishBlack14w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              color: AppColors.black.withAlpha(20),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
              size: 16,
            ),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
        backgroundColor: AppColors.white,
        brightness: Brightness.light,
        title: const Text('PhoneVerificationView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Enter Your Phone Number',
                              style: AppTextStyles.mulishBlack20w700,
                            ),
                            Text(
                              'Please confirm your country code and enter your phone number',
                              style: AppTextStyles.mulishBlack17w600,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        _phoneContainer(),
                      ],
                    ),
                  ),
                  CustomButtonWidget(
                    buttonText: 'Continue',
                    buttonTextStyle: AppTextStyles.mulishWhite16w700,
                    buttonHor: MediaQuery.of(context).size.width * 0.3,
                    buttonVer: MediaQuery.of(context).size.height * 0.02,
                    onTap: () {
                      String? _code;

                      /// internatianal input formatter masking
                      if (_usersPhoneNumber.isEmpty) {
                        Get.snackbar('Warning!', 'Please put your number!');
                      } else if (_selectedCountry!.phoneCode == '+996' &&
                          _usersPhoneNumber.length == 9) {
                        _code = _setCodeBeforeSending();
                        setState(() {});
                        // Get.to(() => PhoneOtpView(code: _code!));
                      } else if (_selectedCountry!.phoneCode == '+7' &&
                          _usersPhoneNumber.length == 10) {
                        _code = _setCodeBeforeSending();
                        setState(() {});
                        // Get.to(() => PhoneOtpView(code: _code!));
                      } else if (_selectedCountry!.phoneCode == '+90' &&
                          _usersPhoneNumber.length == 10) {
                        _code = _setCodeBeforeSending();
                        setState(() {});
                        // Get.to(() => PhoneOtpView(code: _code!));
                      } else {
                        Get.snackbar(
                            'Warning!', 'Phone number does not enough!');
                      }
                      log('_code ==> $_code');
                    },
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    color: AppColors.mainColor.withOpacity(0.1),
                    child: KeyBoardButton(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      onKeyboardTap: _onKeyboardTap,
                      textColor: AppColors.black,
                      rightIcon: const Icon(
                        Icons.backspace,
                        color: AppColors.black,
                      ),
                      rightButtonFn: () {
                        setState(() {
                          if (_usersPhoneNumber.isNotEmpty) {
                            _usersPhoneNumber = _usersPhoneNumber.substring(
                                0, _usersPhoneNumber.length - 1);
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _setCodeBeforeSending() {
    return _selectedCountry!.phoneCode! + ' ' + _usersPhoneNumber;
  }
}

//  NumericKeyboard(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   // onKeyboardTap: _onKeyboardTap,
//   onKeyboardTap: (value) {},
//   textColor: Colors.black,
// rightIcon: Icon(
//   Icons.backspace,
//   color: Colors.black,
// ),
// rightButtonFn: () {
//   setState(() {
//     if (_usersPhoneNumber.isNotEmpty) {
//       _usersPhoneNumber = _usersPhoneNumber.substring(0, _usersPhoneNumber.length - 1);
//     }
//   });
// },
// ),
