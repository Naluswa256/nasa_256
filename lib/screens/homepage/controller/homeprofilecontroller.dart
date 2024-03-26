import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeProfileController extends GetxController
    with GetTickerProviderStateMixin {
  TabController? controller1;
  var selectedindex = 0.obs;

  @override
  void onInit() {
    controller1 = TabController(vsync: this, length: 3);
    controller1!.addListener(() {
      selectedindex.value = controller1!.index;
      log('my index is${controller1!.index}');
    });
    super.onInit();
  }
}
