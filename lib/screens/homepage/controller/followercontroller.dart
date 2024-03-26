import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/images.dart';

class FollowerController extends GetxController
    with GetTickerProviderStateMixin {
  TabController? controller1;
  List viewer = [
    viewer1,
    viewer2,
    viewer3,
    viewer4,
    viewer1,
    viewer2,
    viewer3,
    viewer4,
    viewer5
  ];
  var selectedindex = 0.obs;
  List<int> followlist = [];
  List<String> viewernamelist = [
    "savannah_nguyen",
    "esther_howard",
    "jenny_wilson",
    "jane_cooper",
    "devon_lane",
    "albert_flores",
    "floyd_miles",
    "Jkathryn_murphy",
    "leslie_alexander",
  ];
  List<String> viewersubnamelist = [
    "Savannah Nguyen",
    "Esther Howard",
    "Jenny Wilson",
    "Jane Cooper",
    "Devon Lane",
    "Albert Flores",
    "Floyd Miles",
    "Kathryn Murphy",
    "Leslie Alexander",
  ];

  final List<Tab> myTabs = <Tab>[
    const Tab(
      child: SizedBox(
        
        height: 25,
        width: 95,
        child: Text(
          'Followers',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    const Tab(
      child: SizedBox(
        
        height: 25,
        width: 95,
        child: Text(
          'Following',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    const Tab(
      child: SizedBox(
        
        height: 25,
        width: 100,
        child: Text(
          'Suggested',
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
    super.onInit();
  }
}
