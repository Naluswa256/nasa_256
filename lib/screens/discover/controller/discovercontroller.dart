import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/images.dart';

class DiscoverController extends GetxController
    with GetTickerProviderStateMixin {
  TabController? controller1;
  List<String> soundlist = [
    pic1,
    pic2,
    pic3,
    pic4,
    pic5,
    pic6,
    pic1,
    pic2,
    pic3,
    pic4,
    pic5,
    pic6,
  ];
  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Container(
        color: Colors.white,
        height: 25,
        width: Get.width * .35,
        child: const Text(
          'Trending',
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
          'New',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  ];
  List<String> userimage = [video1, video2, video3, video1, video2, video3];
  List<String> foodlist = [
    food1,
    food2,
    food3,
    food1,
    food2,
    food3,
  ];
  @override
  void onInit() {
    controller1 = TabController(vsync: this, length: myTabs.length);
    super.onInit();
  }
}
