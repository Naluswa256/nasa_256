import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/images.dart';

import '../../../utils/color.dart';
import 'postscreen.dart';
import 'soundscreenfromphoto.dart';

class VideoUploadScreen extends StatefulWidget {
  const VideoUploadScreen({super.key});

  @override
  State<VideoUploadScreen> createState() => _VideoUploadScreenState();
}

class _VideoUploadScreenState extends State<VideoUploadScreen> {
    bool isscreenheight = height <700 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: Get.height,
      width: Get.width,
      child: Stack(children: [
        Image.asset(
          pu2,
          fit: BoxFit.fill,
          height: Get.height,
          width: Get.width,
        ),
        Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: whitecolor,
                  ),
                ),
                SizedBox(
                  width: Get.width * .20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SoundScreenFromPhoto());
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
                            Icons.music_note,
                            size: 16,
                            color: whitecolor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Add Sound',
                            style: TextStyle(
                              color: whitecolor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: sidewidget(),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 58,
                  width: Get.width * .43,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: lightpinkColor),
                  child: const Center(
                    child: Text(
                      'Your Story',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const PostScreen());
                  },
                  child: Container(
                    height: 58,
                    width: Get.width * .43,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: primaryColor),
                    child: const Center(
                      child: Text(
                        'Next',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    ));
  }

  Widget sidewidget() {
    return Align(
      alignment: Alignment.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              SvgPicture.asset(up1,height: 24,width: 24,),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Text',
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
            children: [
              SvgPicture.asset(up2,height: 24,width: 24,),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Stickers',
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
            children: [
              SvgPicture.asset(up3,height: 24,width: 24,),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Effects',
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
            children: [
              SvgPicture.asset(up4,height: 24,width: 24,),
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
         SizedBox(
            height:  isscreenheight ? 5 :10 ,
          ),
          Column(
            children: [
              SvgPicture.asset(up7,height: 24,width: 24,),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Adjust\nclips',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            children: [
             SizedBox(
            height:  isscreenheight ? 5 :10 ,
          ),
              Column(
                children: [
                  SvgPicture.asset(up5,height: 24,width: 24,),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Caption',
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
          ),
          Column(
            children: [
           SizedBox(
            height:  isscreenheight ? 5 :10 ,
          ),
              Column(
                children: [
                  SvgPicture.asset(up6,height: 24,width: 24,),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Privacy\nsettings',
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
          ),
          Column(
            children: [
             SizedBox(
            height:  isscreenheight ? 5 :10 ,
          ),
              Column(
                children: [
                  SvgPicture.asset(up9,height: 24,width: 24,),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Audio\nediting',
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
          ),
        ],
      ),
    );
  }
}
