import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/custom_widget/primarybutton.dart';
import 'package:tiktok/utils/images.dart';

import '../../addphotos/screen/photosscreen.dart';
import '../controller/soundcontroller.dart';

class UseSoundScreen extends StatefulWidget {
  const UseSoundScreen({super.key});

  @override
  State<UseSoundScreen> createState() => _UseSoundScreenState();
}

class _UseSoundScreenState extends State<UseSoundScreen> {
  SoundController soundController = Get.put(SoundController());
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset(musicshare),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(alignment: Alignment.center, children: [
                        Image.asset(musicheadlogo),
                        Image.asset(play)
                      ]),
                      const SizedBox(
                        width: 20,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Beautiful Girl by\n Bessie Cooper',
                            style: TextStyle(
                              color: blackcolor,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '200.1M Videos',
                            style: TextStyle(
                              color: Color(0xFF86878B),
                              fontSize: 15,
                              fontFamily: 'Proxima Nova',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryColor, width: 1.2),
                            borderRadius: BorderRadius.circular(32)),
                        height: 32,
                        width: Get.width * .40,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                play,
                                height: 14,
                                width: 14,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Play Song',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ]),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryColor, width: 1.2),
                            borderRadius: BorderRadius.circular(32)),
                        height: 32,
                        width: Get.width * .40,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                save,
                                color: primaryColor,
                                height: 14,
                                width: 14,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Add to Favorites',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ]),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          user3,
                          height: 60,
                          width: 60,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    const Column(
                      children: [
                        Text(
                          'Bessie Cooper',
                          style: TextStyle(
                            color: blackcolor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Professional Singer',
                          style: TextStyle(
                            color: greyColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 30,
                      width: 70,
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
                    )
                  ]),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    color: lightborderColor,
                    height: 2,
                    width: Get.width,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: Get.height * .50,
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemCount: soundController.soundlist.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: .7,
                              crossAxisCount: 3,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) =>
                          Stack(alignment: Alignment.center, children: [
                        Image.asset(soundController.soundlist[index]),
                        Image.asset(
                          play,
                          color: whitecolor,
                        )
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  )
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: PrimaryButton(
                ontap: () {
                  Get.to(() => const PhotosScreen());
                },
                title: "Use this Sounds"),
          )
        ],
      ),
    );
  }
}
