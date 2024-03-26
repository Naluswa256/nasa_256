import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/screens/addphotos/screen/videouploadscreen.dart';
import 'package:tiktok/utils/custom_widget/primarybutton.dart';
import 'package:tiktok/utils/images.dart';

import '../../../utils/color.dart';
import '../controller/allmediacontroller.dart';
import 'photouploadscreen.dart';

class AllMediaScreen extends StatefulWidget {
  const AllMediaScreen({super.key});

  @override
  State<AllMediaScreen> createState() => _AllMediaScreenState();
}

class _AllMediaScreenState extends State<AllMediaScreen> {
  AllMediaController allMediaController = Get.put(AllMediaController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: const Text(
          'All Media',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Obx(
            () => IconButton(
                onPressed: () {
                  if (allMediaController.isselected.value == true) {
                    allMediaController.isselected.value = false;
                  } else {
                    allMediaController.isselected.value = true;
                  }
                },
                icon: allMediaController.isselected.value
                    ? SvgPicture.asset(check1)
                    : SvgPicture.asset(check)),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(children: [
                  BottomAppBar(
                    surfaceTintColor: whitecolor,
                    height: 50,
                    padding: EdgeInsets.zero,
                    color: whitecolor,
                    child: Center(
                      child: TabBar(
                        tabAlignment: TabAlignment.center,
                        isScrollable: false,
                        controller: allMediaController.controller1,
                        dividerColor: lightborderColor,
                        indicatorColor: primaryColor,
                        tabs: allMediaController.myTabs,
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
                    height: Get.height * .75,
                    color: whitecolor,
                    child: TabBarView(
                      controller: allMediaController.controller1,
                      children: [allWidget(), video(), photos()],
                    ),
                  ),
                ]),
              ),
            ],
          ),
          Obx(
            () => allMediaController.isselected.value == true
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PrimaryButton(
                        ontap: () {
                          allMediaController.controller1!.index == 1
                              ? Get.to(() => const VideoUploadScreen())
                              : Get.to(() => const PhotoUploadScreen());
                        },
                        title: "Next"),
                  )
                : Container(),
          )
        ],
      ),
    );
  }

  Widget allWidget() {
    return SizedBox(
      height: Get.height * .37,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: allMediaController.mediaectlist.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 8.0, crossAxisSpacing: 8.0),
          itemBuilder: (context, index) => Stack(children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    if (allMediaController.selectedlist.contains(index)) {
                      allMediaController.selectedlist.remove(index);
                    } else {
                      allMediaController.selectedlist.add(index);
                    }
                  });
                },
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (allMediaController.selectedlist.contains(index)) {
                          allMediaController.selectedlist.remove(index);
                        } else {
                          allMediaController.selectedlist.add(index);
                        }
                      });
                    },
                    child:
                        Image.asset(allMediaController.mediaectlist[index]))),
            Obx(
              () => allMediaController.isselected.value == true
                  ? Positioned(
                      right: 10,
                      top: 10,
                      child: allMediaController.selectedlist.contains(index)
                          ? SvgPicture.asset(
                              check1,
                            )
                          : SvgPicture.asset(
                              check,
                              color: primaryColor,
                            ))
                  : Container(),
            )
          ]),
        ),
      ),
    );
  }

  Widget video() {
    return SizedBox(
      height: Get.height * .37,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: allMediaController.mediaectlist.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 8.0, crossAxisSpacing: 8.0),
          itemBuilder: (context, index) => Stack(children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (allMediaController.selectedlist.contains(index)) {
                    allMediaController.selectedlist.remove(index);
                  } else {
                    allMediaController.selectedlist.add(index);
                  }
                });
              },
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (allMediaController.selectedlist.contains(index)) {
                      allMediaController.selectedlist.remove(index);
                    } else {
                      allMediaController.selectedlist.add(index);
                    }
                  });
                },
                child: Image.asset(allMediaController.mediaectlist[index]),
              ),
            ),
            Obx(
              () => allMediaController.isselected.value == true
                  ? Positioned(
                      right: 10,
                      top: 10,
                      child: allMediaController.selectedlist.contains(index)
                          ? SvgPicture.asset(
                              check1,
                            )
                          : SvgPicture.asset(
                              check,
                              color: primaryColor,
                            ),
                    )
                  : Container(),
            ),
            const Positioned(
              bottom: 10,
              right: 10,
              child: Text(
                '01:07',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget photos() {
    return SizedBox(
      height: Get.height * .37,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: allMediaController.mediaectlist.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 8.0, crossAxisSpacing: 8.0),
          itemBuilder: (context, index) => Stack(children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    if (allMediaController.selectedlist.contains(index)) {
                      allMediaController.selectedlist.remove(index);
                    } else {
                      allMediaController.selectedlist.add(index);
                    }
                  });
                },
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (allMediaController.selectedlist.contains(index)) {
                          allMediaController.selectedlist.remove(index);
                        } else {
                          allMediaController.selectedlist.add(index);
                        }
                      });
                    },
                    child:
                        Image.asset(allMediaController.mediaectlist[index]))),
            Obx(
              () => allMediaController.isselected.value == true
                  ? Positioned(
                      right: 10,
                      top: 10,
                      child: allMediaController.selectedlist.contains(index)
                          ? SvgPicture.asset(
                              check1,
                            )
                          : SvgPicture.asset(
                              check,
                              color: primaryColor,
                            ))
                  : Container(),
            )
          ]),
        ),
      ),
    );
  }
}
