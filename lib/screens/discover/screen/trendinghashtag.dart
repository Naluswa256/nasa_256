import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/screens/discover/controller/discovercontroller.dart';
import 'package:tiktok/utils/custom_widget/primarybutton.dart';
import 'package:tiktok/utils/images.dart';

import '../../../utils/color.dart';

class TrendingHashtag extends StatefulWidget {
  const TrendingHashtag({super.key});

  @override
  State<TrendingHashtag> createState() => _TrendingHashtagState();
}

class _TrendingHashtagState extends State<TrendingHashtag> {
  DiscoverController discoverController = Get.put(DiscoverController());
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
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Trending Hashtag',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SizedBox(
        height: Get.height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(children: [
                Row(
                  children: [
                    Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: lightpinkColor),
                      child: const Center(
                        child: Text(
                          "#",
                          style: TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.w900,
                              color: primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'amazingfood',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          '122.1M Videos',
                          style: TextStyle(
                            color: greyColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 177,
                          height: 32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(color: primaryColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                save,
                                color: primaryColor,
                                height: 15,
                                width: 12,
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
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                Container(
                  width: Get.width,
                  height: 1.2,
                  color: lightborderColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: Get.height * .69,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemCount: discoverController.soundlist.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .7,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) =>
                        Stack(alignment: Alignment.center, children: [
                      Image.asset(discoverController.soundlist[index]),
                      SvgPicture.asset(
                        playbutton,
                        color: whitecolor,
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
                      )
                    ]),
                  ),
                ),
               
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: PrimaryButton(ontap: () {}, title: "# Use thi Hashtag"),
            )
          ],
        ),
      ),
    );
  }
}
