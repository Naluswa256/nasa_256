import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/images.dart';

import '../controller/livecontroller.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  LiveController liveController = Get.put(LiveController());
  var width = Get.width;
  var height = Get.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Image.asset(
                    younggirl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    feed1,
                                    height: width < 380 ? 35 :48,
                                    width:  width < 380 ? 35 :48,
                                    fit: BoxFit.cover,
                                  ),),),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sarah Wilona',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Dancer & Singer',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                           SizedBox(
                            width: width < 380 ? 7 :15,
                          ),
                          Container(
                            height: 30,
                            width: width < 380 ? 50 :70,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(20)),
                            child:  Center(
                              child: Text(
                                'Follow',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width < 380 ? 12 :14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                           SizedBox(
                            width: width < 380 ? 7 :15,
                          ),
                          GestureDetector(
                            onTap: () {
                              viewerWidget();
                            },
                            child: Container(
                              height: 30,
                              width: width < 380 ? 60 :75,
                              decoration: BoxDecoration(
                                  color: liveboxcolor,
                                  borderRadius: BorderRadius.circular(20)),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 const  Icon(
                                    Icons.group,
                                    color: whitecolor,
                                  ),
                                  Text(
                                    '3.6K',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:  width < 380 ? 12 :14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                         const  Spacer(),
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: whitecolor,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              ratingwidget();
                            },
                            child: Container(
                              height: 27,
                              width: 135,
                              decoration: BoxDecoration(
                                  color: liveboxcolor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Weekly Ranking',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'Proxima Nova',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 27,
                            width: 90,
                            decoration: BoxDecoration(
                              color: liveboxcolor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    discover,
                                    height: 16,
                                    width: 16,
                                    color: primaryColor,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    'Explore',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height<700?  height*.40 : height <750 ? height *.40 :height *.48
                      ),
                      // SizedBox(
                      //   height: height < 900
                      //       ? height - height * .52
                      //       : height < 750
                      //           ? height - height * .60
                      //           : height < 700 ? height - height * .80 :height - height * .40,
                      // ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          height: height*.30,
                          width: Get.width * .70,
                          child: ListView.builder(
                            itemCount: liveController.commentlist.length,
                            itemBuilder: (context, index) => ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Image.asset(
                                  feed2,
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              title: const Text(
                                'Daryl Nehls',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              subtitle: Text(
                                liveController.commentlist[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: blackcolor,
                                  borderRadius: BorderRadius.circular(15)),
                              width: 136,
                              child: const SizedBox(
                                width: 130,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: TextField(
                                    style: TextStyle(
                                        color: whitecolor, fontSize: 14),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: whitecolor,
                                          fontFamily: "ProximaNova"),
                                      hintText: "Comments...",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Column(
                              children: [
                                Icon(
                                  Icons.group,
                                  color: whitecolor,
                                ),
                                Text(
                                  'Multi-gu..',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(rose),
                                const Text(
                                  'Rose',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(gift),
                                const Text(
                                  'Gift',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  musicshare,
                                  color: whitecolor,
                                ),
                                const Text(
                                  '5.7K',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  viewerWidget() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: whitecolor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        width: Get.width,
        height: Get.height * .60,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              '3.6K Viewers',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: blackcolor,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: lightborderColor,
              height: 1.2,
              width: Get.width,
            ),
            SizedBox(
              height: Get.height * .50,
              child: ListView.builder(
                itemCount: liveController.viewer.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    dense: true,
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          liveController.viewer[index],
                          height: 40,
                          width: 40,
                        )),
                    title: Text(
                      liveController.viewernamelist[index],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          'Follow',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: whitecolor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
      isScrollControlled: true,
    );
  }

  ratingwidget() {
    Get.bottomSheet(
        StatefulBuilder(
          builder: (context, setState) => Container(
            height: Get.height * .70,
            width: Get.width,
            decoration: const BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(children: [
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      liveController.selectedindex.value = 0;
                    },
                    child: Column(
                      children: [
                        Obx(
                          () => Text(
                            'Weekly Ranking',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: liveController.selectedindex.value == 0
                                  ? primaryColor
                                  : const Color(0xFF86878B),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => Container(
                            height:
                                liveController.selectedindex.value == 0 ? 2 : 1,
                            width: Get.width * .40,
                            color: liveController.selectedindex.value == 0
                                ? primaryColor
                                : lightborderColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      liveController.selectedindex.value = 1;
                    },
                    child: Column(
                      children: [
                        Obx(
                          () => Text(
                            'Rising Stars',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: liveController.selectedindex.value == 1
                                  ? primaryColor
                                  : const Color(0xFF86878B),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => Container(
                            height:
                                liveController.selectedindex.value == 1 ? 2 : 1,
                            width: Get.width * .40,
                            color: liveController.selectedindex.value == 1
                                ? primaryColor
                                : lightborderColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: Get.height * .58,
                child: ListView.builder(
                  itemCount: liveController.viewer.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      dense: true,
                      leading: SizedBox(
                        width: Get.width * .20,
                        child: Row(
                          children: [
                            Text(
                              " ${index + 1}",
                              style: const TextStyle(
                                color: greyColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                liveController.viewer[index],
                                height: 48,
                                width: 48,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      title: Text(
                        liveController.viewernamelist[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: const Text(
                        '106.4K',
                        style: TextStyle(
                          color: Color(0xFF86878B),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          if (liveController.followlist.contains(index)) {
                            setState(() {
                              liveController.followlist.remove(index);
                            });
                          } else {
                            setState(() {
                              liveController.followlist.add(index);
                            });
                          }
                        },
                        child: liveController.followlist.contains(index)
                            ? Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: primaryColor, width: 1.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Following',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                width: 70,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Follow',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: whitecolor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
        isScrollControlled: true);
  }
}
