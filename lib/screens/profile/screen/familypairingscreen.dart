import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/custom_widget/primarybutton.dart';
import 'package:tiktok/utils/images.dart';

class FamilyPairingScreen extends StatefulWidget {
  const FamilyPairingScreen({super.key});

  @override
  State<FamilyPairingScreen> createState() => _FamilyPairingScreenState();
}

class _FamilyPairingScreenState extends State<FamilyPairingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        backgroundColor: whitecolor,
        surfaceTintColor: whitecolor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Family Pairing',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: Get.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Image.asset(family),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Keeping TokTik family-friendly',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        'Family Pairing allows you to customize\nyour teen’s TokTik settings for a safer\nexperience.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF86878B),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 0.8,
                        width: Get.width,
                        color: lightborderColor,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 270,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 14.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                0.0,
                                0.0,
                              ),
                            )
                          ],
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '• Set a limit on your teen’s watch\n  time',
                              style: TextStyle(
                                color: greyColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '• Limit who can send messages to\n  your teen',
                              style: TextStyle(
                                color: greyColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '• Manage your teen’s privacy and\n  safety settings',
                              style: TextStyle(
                                color: greyColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '• Choose whether your teen can\n  have a private or public account',
                              style: TextStyle(
                                color: greyColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PrimaryButton(ontap: () {}, title: "Continue"),
          )
        ],
      ),
    );
  }
}
