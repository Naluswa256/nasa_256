import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinput/pinput.dart';
import 'package:tiktok/features/authentication/view/authentication/forgotpassword/screen/resetcreatepassword.dart';

import 'package:tiktok/screens/bottomnavigation/screen/bottomnavigationscreen.dart';
import 'package:tiktok/utils/color.dart';

// ignore: must_be_immutable
class OtpScreen extends StatefulWidget {
  bool? isfromforgort;
  OtpScreen({super.key, this.isfromforgort});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Get.back();
        },
      )),
      body: Column(children: [
        const Text(
          'Enter 6-digit code',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Your code was sent to +91 1234567890',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: greyColor,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.center,
          child: Pinput(
            onSubmitted: (val) {
              if (widget.isfromforgort == true) {
                Get.to(() => const ResetCreatePassword());
              } else {
              //  GetStorage().write('issignin', 1);
                Get.offAll(() => const BottomNavigation());
              }
            },
            onCompleted: (val) {
              if (widget.isfromforgort == true) {
                Get.to(() => const ResetCreatePassword());
              } else {
              //  GetStorage().write('issignin', 1);
                Get.offAll(() => const BottomNavigation());
              }
            },
            autofocus: true,
            length: 6,
            defaultPinTheme: PinTheme(
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                width: Get.width * .14,
                height: Get.width * .14,
                decoration: BoxDecoration(
                    color: const Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(15))),
            focusedPinTheme: PinTheme(
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                width: Get.width * .14,
                height: Get.width * .14,
                decoration: BoxDecoration(
                    color: const Color(0xFFF8F8F8),
                    border: Border.all(color: blackcolor),
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        RichText(
            text: const TextSpan(
          children: [
            TextSpan(
              text: "58s",
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
          text: "Resend Code ",
          style: TextStyle(
            color: greyColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ))
      ]),
    );
  }
}
