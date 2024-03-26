import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../controller/photocontroller.dart';
import '../controller/soundcontroller2.dart';
import 'allmediescreen.dart';
import 'soundscreenfromphoto.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  PhotoController photoController = Get.put(PhotoController());
  SoundController2 soundController2 = Get.put(SoundController2());
  bool isscreenheight = height <700 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          photoController.selectedindex2.value != 2
              ? Stack(
                  children: [
                    SizedBox(
                      height: Get.height * .92,
                      width: Get.width,
                      child: Image.asset(
                        man,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: Get.height * .92,
                            width: Get.width,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const SoundScreenFromPhoto());
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 27,
                                      width: 135,
                                      decoration: BoxDecoration(
                                          color: liveboxcolor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.music_note_outlined,
                                              size: 16,
                                              color: whitecolor,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Add Sound',
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
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                sidewidget(),
                                const Spacer(),
                                featurewidget(),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            effectsWidget();
                                          },
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                emoji,
                                                height: 32,
                                                width: 32,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Text(
                                                'Effects',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        photoController
                                                    .selectedstoryindex.value ==
                                                1
                                            ? Image.asset(
                                                record2,
                                              )
                                            : Image.asset(
                                                record,
                                              ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(
                                                () => const AllMediaScreen());
                                          },
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                upload,
                                                height: 32,
                                                width: 32,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Text(
                                                'Upload',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 39,
                            child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(Icons.close),
                              color: whitecolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(
                  height: Get.height * .92,
                  width: Get.width,
                  color: blackcolor,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: whitecolor,
                            )),
                      ),
                      const Text(
                        'My 2020',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: whitecolor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Upload up to 8 photos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CarouselSlider.builder(
                        options: CarouselOptions(
                            aspectRatio: 14 / 12,
                            // height: Get.height * .50,
                            enlargeCenterPage: true),
                        itemCount: 5,
                        itemBuilder: (context, index, realindex) => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            upload1,
                            fit: BoxFit.fill,
                            // height: Get.height * .60,
                            // width: Get.width * .60,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '3/22',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 44,
                        width: Get.width * .65,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(22)),
                        child: const Center(
                          child: Text(
                            'Select photos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
          Container(
            height: Get.height * .08,
            width: Get.width,
            color: blackcolor,
            child: Transform.translate(
              offset:
                  Offset(photoController.xvalue2, photoController.yvalue.value),
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: Get.width * .50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            photoController.xvalue2 = -30.0;

                            photoController.selectedindex2.value = 0;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            'Camera',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: photoController.selectedindex2.value == 0
                                  ? Colors.white
                                  : const Color(0xFF86878B),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            photoController.xvalue2 = -90.0;
                            photoController.selectedindex2.value = 1;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            'Story',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: photoController.selectedindex2.value == 1
                                  ? Colors.white
                                  : const Color(0xFF86878B),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            photoController.xvalue2 = -150.0;
                            photoController.selectedindex2.value = 2;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            'Templates',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: photoController.selectedindex2.value == 2
                                  ? Colors.white
                                  : const Color(0xFF86878B),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  effectsWidget() {
    Get.bottomSheet(
        StatefulBuilder(
          builder: (context, setState) => Container(
            height: Get.height * .60,
            width: Get.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: whitecolor),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(children: [
                const SizedBox(
                  height: 75,
                  child: Center(
                    child: Text(
                      'Effects',
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
                  height: 0.5,
                  width: Get.width,
                ),
                const SizedBox(
                  height: 10,
                ),
                effectmenuWidget(),
                SizedBox(
                  height: Get.height * .37,
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: photoController.effectlist.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (context, index) =>
                        Image.asset(photoController.effectlist[index]),
                  ),
                )
              ]),
            ),
          ),
        ),
        isScrollControlled: true,
        clipBehavior: Clip.none);
  }

  Widget effectmenuWidget() {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: greyColor,
            )),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            save1,
            height: 18,
            width: 18,
            color: greyColor,
          ),
        ),
        Obx(
          () => GestureDetector(
            onTap: () {
              photoController.selectedindex2.value = 0;
            },
            child: Column(
              children: [
                Text(
                  'Trending',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: photoController.selectedindex2.value == 0
                        ? primaryColor
                        : const Color(0xFF86878B),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Container(
                    height: photoController.selectedindex2.value == 0 ? 2 : 1,
                    width: Get.width * .30,
                    color: photoController.selectedindex2.value == 0
                        ? primaryColor
                        : lightborderColor,
                  ),
                )
              ],
            ),
          ),
        ),
        Obx(
          () => GestureDetector(
            onTap: () {
              photoController.selectedindex2.value = 1;
            },
            child: Column(
              children: [
                Text(
                  'New',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: photoController.selectedindex2.value == 1
                        ? primaryColor
                        : const Color(0xFF86878B),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Container(
                    height: photoController.selectedindex2.value == 1 ? 2 : 1,
                    width: Get.width * .30,
                    color: photoController.selectedindex2.value == 1
                        ? primaryColor
                        : lightborderColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget featurewidget() {
    return photoController.selectedindex2.value == 1
        ? Transform.translate(
            offset: Offset(photoController.storyxvalue.value,
                photoController.storyyvalue.value),
            child: SizedBox(
              width: Get.width * .50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        photoController.storyxvalue.value = 40.0;
                        photoController.selectedstoryindex.value = 0;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                          color: liveboxcolor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          'Photo',
                          style: TextStyle(
                            color: photoController.selectedstoryindex.value == 0
                                ? Colors.white
                                : const Color(0xFF86878B),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        photoController.storyxvalue.value = -40.0;
                        photoController.selectedstoryindex.value = 1;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: liveboxcolor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Video',
                          style: TextStyle(
                            color: photoController.selectedstoryindex.value == 1
                                ? Colors.white
                                : const Color(0xFF86878B),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Transform.translate(
            offset:
                Offset(photoController.xvalue, photoController.yvalue.value),
            child: SizedBox(
              width: Get.width * .50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        photoController.xvalue = 60.0;
                        photoController.selectedindex.value = 2;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                        color: liveboxcolor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          '3m',
                          style: TextStyle(
                            color: photoController.selectedindex.value == 2
                                ? Colors.white
                                : const Color(0xFF86878B),
                            fontSize: 12,
                            fontFamily: 'Proxima Nova',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        photoController.xvalue = 0.0;
                        photoController.selectedindex.value = 1;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          color: liveboxcolor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          '60s',
                          style: TextStyle(
                            color: photoController.selectedindex.value == 1
                                ? Colors.white
                                : const Color(0xFF86878B),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        photoController.xvalue = -60.0;
                        photoController.selectedindex.value = 0;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                        color: liveboxcolor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          '15s',
                          style: TextStyle(
                            color: photoController.selectedindex.value == 0
                                ? Colors.white
                                : const Color(0xFF86878B),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Widget sidewidget() {
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(cam,height: 24,width: 24,),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Flip',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
               SizedBox(
              height:  isscreenheight ? 5 :10 ,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(speed,height: 24,width: 24,),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Speed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
             SizedBox(
              height:  isscreenheight ? 5 :10 ,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(retouch,height: 24,width: 24,),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Retouch',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
             SizedBox(
              height:  isscreenheight ? 5 :10 ,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(filter,height: 24,width: 24,),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Filters',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            photoController.selectedstoryindex.value == 1
                ? Column(
                    children: [
                       SizedBox(
              height:  isscreenheight ? 5 :10 ,
            ),
                      Column(
                        children: [
                          SvgPicture.asset(stopwatch,height: 24,width: 24,),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Timer',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Container(),
            photoController.selectedstoryindex.value == 1
                ? Column(
                    children: [
                       SizedBox(
              height:  isscreenheight ? 5 :10 ,
            ),
                      Column(
                        children: [
                          SvgPicture.asset(flash,height: 24,width: 24,),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Flash',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
