import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenTimeController extends GetxController
    with GetTickerProviderStateMixin {
  TabController? controller1;
  var weeklyswitch = false.obs;
  var selectedindex = 1.obs;
  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Container(
        color: Colors.white,
        height: 25,
        width: Get.width * .35,
        child: const Text(
          'Time spent',
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
          'App opened',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  ];
  List<String> datelist = [
    "Oct 23-Oct 29",
    "Nov 30-Nov 5",
    "Nov 6-Nov 12",
    "Nov 13-Nov 19"
  ];
  List<SpendData> data = [
    SpendData('MON\n13', 0.6),
    SpendData('TUE\n14', 2),
    SpendData('WED\n15', 1.5),
    SpendData('THU\n16', 3.2),
    SpendData('FRI\n17', 4),
    SpendData('SAT\n18', 2.4),
    SpendData('SUN\n19', 1.9)
  ];

  List<SpendData> data2 = [
    SpendData('MON\n13', 0),
    SpendData('TUE\n14', 1.3),
    SpendData('WED\n15', 8),
    SpendData('THU\n16', 1.8),
    SpendData('FRI\n17', 1.6),
    SpendData('SAT\n18', 0),
    SpendData('SUN\n19', 0)
  ];

  @override
  void onInit() {
    controller1 = TabController(vsync: this, length: myTabs.length);

    super.onInit();
  }
}

class SpendData {
  SpendData(this.year, this.sales);

  final String year;
  final double sales;
}
