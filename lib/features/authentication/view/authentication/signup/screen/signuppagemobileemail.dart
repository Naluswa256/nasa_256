import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tiktok/features/authentication/view/authentication/signup/screen/otpscreen.dart';
import 'package:tiktok/utils/custom_widget/buttonwidget.dart';

import '../../../../../../utils/color.dart';
import '../controller/signupcontroller.dart';
import 'createpasswordscreen.dart';

class SignUpMobileEmailScreen extends StatefulWidget {
  const SignUpMobileEmailScreen({super.key});

  @override
  State<SignUpMobileEmailScreen> createState() =>
      _SignUpMobileEmailScreenState();
}

class _SignUpMobileEmailScreenState extends State<SignUpMobileEmailScreen> {
  SignUpController signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Sign up',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(children: [
                    headwidget(),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(
                      () => signUpController.selectedindex.value == 0
                          ? phoneWidget()
                          : emailWidget(),
                    )
                  ]),
                ),
              ),
            ),
          ),
          Obx(
            () => ButtonWidget(
                buttoncolor:
                    signUpController.mobilecontroller.text.isNotEmpty ||
                            signUpController.emailcontroller.text.isNotEmpty
                        ? primaryColor
                        : lightpinkColor,
                buttontitle: signUpController.selectedindex.value == 0
                    ? "Send Code"
                    : "Next",
                ontap: () {
                  if (signUpController.selectedindex.value == 0) {
                    Get.to(() => OtpScreen());
                  } else {
                    Get.to(() => const CreatePasswordScreen());
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget phoneWidget() {
    return Column(
      children: [
        countrypicker(),
        const SizedBox(
          height: 30,
        ),
        bottomwidget()
      ],
    );
  }

  Widget emailWidget() {
    return Column(
      children: [
        TextField(
          onChanged: (val) {
            setState(() {});
          },
          controller: signUpController.emailcontroller,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: blackcolor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: lightborderColor,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: lightborderColor,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: lightborderColor,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: lightborderColor,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            labelText: "Email address",
            labelStyle: const TextStyle(
              color: blackcolor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'By continuing, you agree to TokTik’s Terms of Service and\nconfirm that you have read TokTik’s Privacy Policy',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: greyColor,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget bottomwidget() {
    return Column(
      children: [
        TextField(
          onChanged: (val) {
            setState(() {});
          },
          controller: signUpController.mobilecontroller,
          keyboardType: TextInputType.phone,
          style: const TextStyle(
            color: blackcolor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: lightborderColor,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: lightborderColor,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: lightborderColor,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: lightborderColor,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            labelText: "Mobile Number",
            labelStyle: const TextStyle(
              color: blackcolor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Your phone number will be used to improve your\nTokTik experience, including connecting you with people\nyou may know, personalizing your ads experience, and\nmore. if you sign up with SMS, Fees may apply.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF86878B),
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget headwidget() {
    return Container(
      width: 275,
      height: 48,
      decoration: BoxDecoration(
          color: lightpinkColor, borderRadius: BorderRadius.circular(40)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => GestureDetector(
              onTap: () {
                signUpController.selectedindex.value = 0;
              },
              child: Container(
                width: 130,
                height: 36,
                decoration: BoxDecoration(
                    boxShadow: [
                      signUpController.selectedindex.value == 0
                          ? const BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 2,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          : const BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 0.0,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                    ],
                    borderRadius: BorderRadius.circular(40),
                    color: signUpController.selectedindex.value == 0
                        ? primaryColor
                        : lightpinkColor),
                child: Center(
                  child: Text(
                    'Phone',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: signUpController.selectedindex.value == 0
                          ? whitecolor
                          : blackcolor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => GestureDetector(
              onTap: () {
                signUpController.selectedindex.value = 1;
              },
              child: Container(
                width: 130,
                height: 36,
                decoration: BoxDecoration(
                    boxShadow: [
                      signUpController.selectedindex.value == 1
                          ? const BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 2,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          : const BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 0.0,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                    ],
                    borderRadius: BorderRadius.circular(40),
                    color: signUpController.selectedindex.value == 1
                        ? primaryColor
                        : lightpinkColor),
                child: Center(
                  child: Text(
                    'Email',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: signUpController.selectedindex.value == 1
                          ? whitecolor
                          : blackcolor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget countrypicker() {
    return SizedBox(
      height: 55,
      child: IntlPhoneField(
        controller: signUpController.phonecontroller,
        textInputAction: TextInputAction.done,
        dropdownIcon: const Icon(
          Icons.arrow_forward_ios_outlined,
          color: blackcolor,
          size: 16,
        ),
        showCursor: false,
        showCountryFlag: true,
        disableLengthCheck: true,
        dropdownTextStyle: const TextStyle(fontFamily: "OpenSans"),
        style: const TextStyle(fontFamily: "OpenSans", fontSize: 15),
        initialCountryCode: 'IN',
        readOnly: true,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: lightborderColor),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: lightborderColor),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: lightborderColor),
              borderRadius: BorderRadius.circular(20)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: lightborderColor),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onChanged: (phone) {},
      ),
    );
  }
}
