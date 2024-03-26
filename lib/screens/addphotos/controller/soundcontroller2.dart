import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/images.dart';

class SoundController2 extends GetxController with GetTickerProviderStateMixin {
  TabController? controller1;

  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Container(
        color: Colors.white,
        height: 25,
        width: Get.width * .35,
        child: const Text(
          'Discover',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    Tab(
      child: Container(
        color: Colors.white,
        height: 25,
        width: Get.width * .35,
        child: const Text(
          'Favourite',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  ];
  List selecteditem = [];
  List<String> musicname = [
    "Ruby Sparks",
    "Love You So",
    "Made You Look",
    "Lollipop",
    "Just Wanna Rock",
    "Funny Song",
    "Rich Flex"
  ];
  List<String> musicimages = [
    music1,
    music2,
    music3,
    music4,
    music5,
    music6,
    music7
  ];
  TabController? controller2;
  final List<Tab> myTabs2 = <Tab>[
    Tab(
      child: Container(
        color: Colors.white,
        height: 25,
        width: Get.width * .35,
        child: const Text(
          'Sounds',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    Tab(
      child: SizedBox(
        height: 25,
        width: Get.width * .35,
        child: const Text(
          'Hashtag',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  ];

  @override
  void onInit() {
    controller1 = TabController(vsync: this, length: myTabs.length);
    controller2 = TabController(vsync: this, length: myTabs2.length);
    super.onInit();
  }
}
