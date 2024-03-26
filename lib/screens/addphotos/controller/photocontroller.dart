import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/images.dart';

class PhotoController extends GetxController with GetTickerProviderStateMixin {
  var xvalue = -60.0.obs;
  var yvalue = 0.0.obs;
  var xvalue2 = -30.0.obs;
  var yvalue2 = 0.0.obs;
  var selectedindex = 0.obs;
  var selectedindex2 = 0.obs;
  var selectedstoryindex = 0.obs;
  var storyxvalue = 30.0.obs;
  var storyyvalue = 0.0.obs;
  var selectedindex1 = 0.obs;
  var comment = false.obs;
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

  List<String> effectlist = [
    eff1,
    eff2,
    eff3,
    eff4,
    eff5,
    eff6,
    eff7,
    eff8,
    eff9,
    eff10,
    eff11,
    eff12,
    eff1,
    eff2,
    eff3,
    eff4,
    eff5,
    eff6,
    eff7,
    eff8,
    eff9,
    eff10,
    eff11,
    eff12
  ];

  @override
  void onInit() {
    controller2 = TabController(vsync: this, length: myTabs2.length);
    super.onInit();
  }
}
