import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tiktok/utils/custom_widget/primarybutton.dart';
import 'package:tiktok/utils/images.dart';

import '../../../utils/color.dart';
import '../controller/screentimecontroller.dart';

class ScrenTimeScreen extends StatefulWidget {
  const ScrenTimeScreen({super.key});

  @override
  State<ScrenTimeScreen> createState() => _ScrenTimeScreenState();
}

class _ScrenTimeScreenState extends State<ScrenTimeScreen> {
  ScreenTimeController screenTimeController = Get.put(ScreenTimeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        backgroundColor: whitecolor,
        surfaceTintColor: whitecolor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'Screen time',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text(
                    "Daily screen time",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: SizedBox(
                    width: Get.width * .40,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Off",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF86878B),
                            fontSize: 16,
                            fontFamily: 'Proxima Nova',
                            fontWeight: FontWeight.w400,
                            height: 0.08,
                            letterSpacing: -0.16,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: greyColor,
                        ),
                      ],
                    ),
                  )),
              const Text(
                'Get notified if you reach your time on TokTik.',
                style: TextStyle(
                  color: Color(0xFF86878B),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text(
                    "screen time breaks",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: SizedBox(
                    width: Get.width * .40,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Off",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF86878B),
                            fontSize: 16,
                            fontFamily: 'Proxima Nova',
                            fontWeight: FontWeight.w400,
                            height: 0.08,
                            letterSpacing: -0.16,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: greyColor,
                        ),
                      ],
                    ),
                  )),
              const Text(
                'Get reminded to take breaks from the app.',
                style: TextStyle(
                  color: Color(0xFF86878B),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text(
                  "Weekly screen time updates",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Obx(
                  () => Switch(
                    value: screenTimeController.weeklyswitch.value,
                    onChanged: (val) {
                      screenTimeController.weeklyswitch.value = val;
                    },
                    activeColor: whitecolor,
                    inactiveTrackColor: lightborderColor,
                    inactiveThumbColor: whitecolor,
                    activeTrackColor: primaryColor,
                  ),
                ),
              ),
              const Text(
                'stay updated on your time from your app Inbox.',
                style: TextStyle(
                  color: Color(0xFF86878B),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Account Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ListTile(
                onTap: () {
                  changeweek();
                },
                contentPadding: const EdgeInsets.all(0),
                leading: const Icon(
                  Icons.calendar_month_outlined,
                  color: primaryColor,
                ),
                title: const Text(
                  'This week',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: const Text(
                  'Nov 13, 2022-Nov 19, 2022',
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: greyColor,
                  size: 24,
                ),
              ),
              BottomAppBar(
                surfaceTintColor: whitecolor,
                height: 50,
                padding: EdgeInsets.zero,
                color: whitecolor,
                child: Center(
                  child: TabBar(
                    tabAlignment: TabAlignment.center,
                    isScrollable: false,
                    controller: screenTimeController.controller1,
                    dividerColor: lightborderColor,
                    indicatorColor: primaryColor,
                    tabs: screenTimeController.myTabs,
                    labelColor: primaryColor,
                    labelStyle: const TextStyle(
                      color: Color(0xFF797979),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                height: 700,
                color: whitecolor,
                child: TabBarView(
                  controller: screenTimeController.controller1,
                  children: [timeSpentWidget(), appOpenedWidget()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  changeweek() {
    Get.bottomSheet(
        Container(
          width: Get.width,
          height:height< 700 ? height*.65: Get.height * .60,
          decoration: const BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(children: [
            const SizedBox(
              height: 75,
              child: Center(
                child: Text(
                  'Choose Week',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: blackcolor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              color: lightborderColor,
              height: 1.2,
              width: Get.width,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: screenTimeController.datelist.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    setState(() {
                      screenTimeController.selectedindex.value = index;
                    });
                  },
                  title: Obx(
                    () => Text(
                      screenTimeController.datelist[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: screenTimeController.selectedindex.value == index
                            ? blackcolor
                            : greyColor,
                        fontSize:
                            screenTimeController.selectedindex.value == index
                                ? 20
                                : 18,
                        fontWeight:
                            screenTimeController.selectedindex.value == index
                                ? FontWeight.w700
                                : FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryButton(
                  ontap: () {
                    Get.back();
                  },
                  title: "Done"),
            )
          ]),
        ),
        isScrollControlled: true,
        clipBehavior: Clip.none);
  }

  Widget timeSpentWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 500,
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis:  NumericAxis(
                  minimum: 0, maximum: 5, interval: 1, labelFormat: "{value}h"),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<SpendData, String>>[
                ColumnSeries<SpendData, String>(
                  width: 0.6,
                  dataSource: screenTimeController.data,
                  xValueMapper: (SpendData spend, _) => spend.year,
                  yValueMapper: (SpendData spend, _) => spend.sales,
                  borderRadius: BorderRadius.circular(7),
                  color: primaryColor,

                  // Enable data label
                )
              ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '19h 45m',
                  style: TextStyle(
                    color: Color(0xFF86878B),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Day time',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '19h 45m',
                  style: TextStyle(
                    color: Color(0xFF86878B),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: Get.width * .010,
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Night time',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '0h 0m',
              style: TextStyle(
                color: Color(0xFF86878B),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget appOpenedWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 500,
          child: SfCartesianChart(
              primaryXAxis:  CategoryAxis(),
              primaryYAxis:  NumericAxis(
                  minimum: 0,
                  maximum: 10,
                  interval: 2,
                  labelFormat: "{value}h"),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<SpendData, String>>[
                ColumnSeries<SpendData, String>(
                  width: 0.6,
                  dataSource: screenTimeController.data2,
                  xValueMapper: (SpendData spend, _) => spend.year,
                  yValueMapper: (SpendData spend, _) => spend.sales,
                  borderRadius: BorderRadius.circular(7),
                  color: primaryColor,

                  // Enable data label
                )
              ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '19h 45m',
                  style: TextStyle(
                    color: Color(0xFF86878B),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Day time',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '19h 45m',
                  style: TextStyle(
                    color: Color(0xFF86878B),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: Get.width * .010,
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Night time',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '0h 0m',
              style: TextStyle(
                color: Color(0xFF86878B),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      ],
    );
  }
}
