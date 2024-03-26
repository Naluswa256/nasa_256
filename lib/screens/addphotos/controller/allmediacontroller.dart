import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/images.dart';

class AllMediaController extends GetxController
    with GetTickerProviderStateMixin {
  TabController? controller1;
  var isselected = false.obs;

  var selectedlist = [];

  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Container(
        color: Colors.white,
        height: 25,
        width: Get.width * .2,
        child: const Text(
          'All',
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
        width: Get.width * .2,
        child: const Text(
          'Videos',
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
        width: Get.width * .2,
        child: const Text(
          'Photos',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  ];
  List<String> mediaectlist = [
    media1,
    media2,
    media3,
    media4,
    media5,
    media6,
    media7,
    media8,
    media9,
    media10,
    media11,
    media12,
    media13,
    media14,
    media1,
    media2,
    media3,
    media4,
    media5,
    media6,
    media7,
    media8,
    media9,
    media10,
    media11,
    media12
  ];

  @override
  void onInit() {
    controller1 = TabController(vsync: this, length: myTabs.length);
    super.onInit();
  }
}
