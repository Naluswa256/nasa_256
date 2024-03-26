import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/custom_widget/buttonwidget.dart';
import 'package:tiktok/utils/images.dart';

import '../../signup/screen/signuppagemobileemail.dart';

class BirthDayScreen extends StatefulWidget {
  const BirthDayScreen({super.key});

  @override
  State<BirthDayScreen> createState() => _BirthDayScreenState();
}

class _BirthDayScreenState extends State<BirthDayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back))),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'When’s your birthday?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Text(
                        'Your birthday won’t be shown publicly',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          fontSize: 16,
                          color: blackcolor,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Image.asset(calender),
                          border: OutlineInputBorder(
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
                          hintText: "MM/DD/YYYY",
                          hintStyle: const TextStyle(
                            color: greyColor,
                            fontSize: 16,
                            fontFamily: 'Proxima Nova',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ),
          ButtonWidget(
              buttontitle: "Next",
              ontap: () {
                Get.to(() => const SignUpMobileEmailScreen());
              })
        ],
      ),
    );
  }
}
