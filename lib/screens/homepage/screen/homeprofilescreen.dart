import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/images.dart';

import '../controller/homeprofilecontroller.dart';
import 'followerscreen.dart';

class HomeProfileScreen extends StatefulWidget {
  const HomeProfileScreen({super.key});

  @override
  State<HomeProfileScreen> createState() => _HomeProfileScreenState();
}

class _HomeProfileScreenState extends State<HomeProfileScreen> {
  HomeProfileController homeprofileController =
      Get.put(HomeProfileController());

  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = <Tab>[
      Tab(
          child: Obx(
        () => SizedBox(
            height: 25,
            width: Get.width * .20,
            child: SvgPicture.asset(
              pro1,
              color: homeprofileController.selectedindex.value == 0
                  ? primaryColor
                  : greyColor,
            )),
      )),
      Tab(
        child: Obx(
          () => SizedBox(
              height: 25,
              width: Get.width * .20,
              child: SvgPicture.asset(
                pro3,
                color: homeprofileController.selectedindex.value == 1
                    ? primaryColor
                    : greyColor,
              )),
        ),
      ),
      Tab(
        child: Obx(
          () => SizedBox(
            // color: Colors.white,
            height: 25,
            width: Get.width * .20,
            child: SvgPicture.asset(pro4,
                color: homeprofileController.selectedindex.value == 2
                    ? primaryColor
                    : greyColor),
          ),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'Craig love',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_sharp))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SizedBox(
            height: Get.height,
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.asset(
                          profiledp,
                          height: 120,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        '@craig_love ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Text(
                        'Designer & Videographer',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      countWidget(),
                      const SizedBox(
                        height: 15,
                      ),
                      buttonWidget(),
                      const SizedBox(
                        height: 10,
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
                            controller: homeprofileController.controller1,
                            dividerColor: lightborderColor,
                            indicatorColor: primaryColor,
                            tabs: myTabs,
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
                          controller: homeprofileController.controller1,
                          children: [menuscreen(), menuscreen(), menuscreen()],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget menuscreen() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: Get.height * .70,
          child: GridView.builder(
            primary: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 15,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 8,
                childAspectRatio: .6,
                mainAxisSpacing: 10,
                crossAxisCount: 3),
            itemBuilder: (context, index) =>
                Stack(alignment: Alignment.center, children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.asset(
                    video1,
                    height: 290,
                    fit: BoxFit.fill,
                  )),
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
                      height: 15,
                      width: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '728.5K',
                      style: TextStyle(
                        color: whitecolor,
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
      ],
    );
  }

  Widget buttonWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32), color: primaryColor),
          height: 38,
          width: Get.width / 3.3,
          child: const Center(
            child: Text(
              'Follow',
              style: TextStyle(
                color: whitecolor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(32),
          ),
          height: 38,
          width: Get.width / 3.3,
          child: const Center(
            child: Text(
              'Message',
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            color: lightpinkColor,
          ),
          child: SvgPicture.asset(
            post7,
            fit: BoxFit.fill,
            height: 20,
            width: 20,
          ),
        ),
        Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            color: lightpinkColor,
          ),
          child: const Icon(
            Icons.arrow_drop_down_sharp,
            color: primaryColor,
          ),
        )
      ],
    );
  }

  Widget countWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Column(
          children: [
            Text(
              '231',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Posts',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Container(
          height: 51,
          width: 1.2,
          color: lightborderColor,
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => const FollowerScreen());
          },
          child: const Column(
            children: [
              Text(
                '1.7M',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Followers',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 51,
          width: 1.2,
          color: lightborderColor,
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => const FollowerScreen());
          },
          child: const Column(
            children: [
              Text(
                '211',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Following',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 51,
          width: 1.2,
          color: lightborderColor,
        ),
        GestureDetector(
          onTap: () {
            likewidget();
          },
          child: const Column(
            children: [
              Text(
                '31M',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Likes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  likewidget() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)), //this right here
            child: Container(
              height: 500,
              width: Get.width * .80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      likegif,
                      height: 300,
                      width: 300,
                    ),
                    const Text(
                      'Total Likes',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text(
                      'cralg_love received a total of 31M\nlikes across all videos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: blackcolor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(32)),
                        height: 58,
                        width: 270,
                        child: const Center(
                          child: Text(
                            'OK',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: whitecolor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
