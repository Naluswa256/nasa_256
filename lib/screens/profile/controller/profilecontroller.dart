import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/color.dart';

class ProfileController extends GetxController
    with GetTickerProviderStateMixin {
  TabController? controller1;
  var selectedindex = 0.obs;

  Color? tabcolor1 = greyColor;

  Color? tabcolor2 = greyColor;
  Color? tabcolor3 = greyColor;
  Color? tabcolor4 = greyColor;

  @override
  void onInit() {
    controller1 = TabController(vsync: this, length: 4);
    controller1!.addListener(() {
      selectedindex.value = controller1!.index;
      log('my index is${controller1!.index}');
    });
    super.onInit();
  }
}
