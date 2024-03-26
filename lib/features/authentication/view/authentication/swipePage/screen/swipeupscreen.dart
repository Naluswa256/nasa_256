import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/screens/bottomnavigation/screen/bottomnavigationscreen.dart';

import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/images.dart';

import '../../../../../../utils/custom_widget/buttonwidget.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({super.key});

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Swipe Up',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Keep discovering more videos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: greyColor,
                        fontSize: 18,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          card2,
                          width: Get.width * .70,
                        ),
                        Positioned(
                            right: 70,
                            bottom: 70,
                            child: SvgPicture.asset(whitecircle)),
                        Positioned(
                            right: -20,
                            bottom: -45,
                            child: Image.asset(
                              hand,
                              height: 150,
                              width: 150,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                  ]),
            ),
          ),
          ButtonWidget(
              buttontitle: "Start watching",
              ontap: () {
                Get.offAll(() => const BottomNavigation());
              })
        ],
      ),
    );
  }
}
