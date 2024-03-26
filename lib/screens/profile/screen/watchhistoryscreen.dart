import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';
import '../../../utils/custom_widget/primarybutton.dart';
import '../../../utils/images.dart';
import '../controller/watchhistorycontroller.dart';

class WatchHistoryScreen extends StatefulWidget {
  const WatchHistoryScreen({super.key});

  @override
  State<WatchHistoryScreen> createState() => _WatchHistoryScreenState();
}

class _WatchHistoryScreenState extends State<WatchHistoryScreen> {
  WatchHistoryController watchHistoryController =
      Get.put(WatchHistoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,

      appBar: AppBar(
        backgroundColor: whitecolor,
        surfaceTintColor: whitecolor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Watch history',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Obx(
            () => IconButton(
                onPressed: () {
                  if (watchHistoryController.isselected.value == true) {
                    watchHistoryController.isselected.value = false;
                  } else {
                    watchHistoryController.isselected.value = true;
                  }
                },
                icon: watchHistoryController.isselected.value
                    ? SvgPicture.asset(check1)
                    : SvgPicture.asset(check)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Learn more about watch history',
              style: TextStyle(
                color: greyColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Today',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            video(),
            const SizedBox(height: 12),
            Obx(
              () => watchHistoryController.isselected.value == true
                  ? PrimaryButton(ontap: () {}, title: "Clear")
                  : Container(),
            )
          ],
        ),
      ),
    );
  }

  Widget video() {
    return SizedBox(
      height:height <700 ? height *.65: Get.height * .70,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount: watchHistoryController.watchlist.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .7, crossAxisCount: 3, mainAxisSpacing: 10),
        itemBuilder: (context, index) =>
            Stack(alignment: Alignment.center, children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  if (watchHistoryController.selectedlist.contains(index)) {
                    watchHistoryController.selectedlist.remove(index);
                  } else {
                    watchHistoryController.selectedlist.add(index);
                  }
                });
              },
              child: Image.asset(watchHistoryController.watchlist[index])),
          SvgPicture.asset(
            playbutton,
            color: whitecolor,
          ),
          Obx(
            () => watchHistoryController.isselected.value == true
                ? Positioned(
                    right: 20,
                    top: 10,
                    child: watchHistoryController.selectedlist.contains(index)
                        ? SvgPicture.asset(
                            check1,
                          )
                        : SvgPicture.asset(
                            check,
                            color: primaryColor,
                          ))
                : Container(),
          ),
          Positioned(
            bottom: 10,
            left: 15,
            child: Row(
              children: [
                SvgPicture.asset(
                  playbutton,
                  color: primaryColor,
                  height: 12,
                  width: 12,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  '728.5K',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
