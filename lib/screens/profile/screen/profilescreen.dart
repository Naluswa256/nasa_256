import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/screens/profile/controller/profilecontroller.dart';
import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/images.dart';

import '../../homepage/screen/followerscreen.dart';
import 'editprofilescreen.dart';
import 'findfrendsscreen.dart';
import 'qrscreen.dart';
import 'settingscreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = <Tab>[
      Tab(
        child: Obx(
          () => SvgPicture.asset(
            pro1,
            color: profileController.selectedindex.value == 0
                ? primaryColor
                : greyColor,
          ),
        ),
      ),
      Tab(
        child: Obx(
          () => SvgPicture.asset(
            pro2,
            color: profileController.selectedindex.value == 1
                ? primaryColor
                : greyColor,
          ),
        ),
      ),
      Tab(
        child: Obx(
          () => SvgPicture.asset(
            pro3,
            color: profileController.selectedindex.value == 2
                ? primaryColor
                : greyColor,
          ),
        ),
      ),
      Tab(
        child: Obx(
          () => SvgPicture.asset(
            pro4,
            color: profileController.selectedindex.value == 3
                ? primaryColor
                : greyColor,
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.to(() => const FindFriendsScreen());
            },
            icon: const Icon(Icons.person_add_alt_1_outlined)),
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            chooseAccountwidget();
          },
          child: const Text(
            'John_d..',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const SettingScreen());
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: SizedBox(
        height: Get.height,
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 116,
                        height: 116,
                        decoration: const ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage(profilepic),
                            fit: BoxFit.fill,
                          ),
                          shape: OvalBorder(),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: -0,
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: primaryColor),
                          child: const Center(
                            child: Icon(
                              Icons.edit,
                              size: 18,
                              color: whitecolor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '@John_doe',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(() => const QrScreen());
                        },
                        icon: const Icon(
                          Icons.qr_code_2_rounded,
                          color: greyColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Designer & Videographer',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  countWidget(),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const EditProfileScreen());
                    },
                    child: Container(
                      width: Get.width,
                      height: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: primaryColor, width: 2)),
                      child: const Center(
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  BottomAppBar(
                    surfaceTintColor: whitecolor,
                    height: 50,
                    padding: EdgeInsets.zero,
                    color: whitecolor,
                    child: Center(
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        onTap: (index) {},
                        tabAlignment: TabAlignment.fill,
                        isScrollable: false,
                        unselectedLabelColor: greyEB,
                        controller: profileController.controller1,
                        dividerColor: lightborderColor,
                        indicatorColor: primaryColor,
                        tabs: myTabs,
                        labelColor: primaryColor,
                        labelStyle: const TextStyle(
                          color: primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height,
                    color: whitecolor,
                    child: TabBarView(
                      physics: const BouncingScrollPhysics(),
                      controller: profileController.controller1,
                      children: [menu(), menu(), menu(), menu()],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  chooseAccountwidget() {
    Get.bottomSheet(
        Container(
          width: Get.width,
          height: Get.height * .70,
          decoration: const BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(children: [
              const SizedBox(
                height: 75,
                child: Center(
                  child: Text(
                    'Switch Account',
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
              ListTile(
                onTap: () {
                  profileController.selectedindex.value = 0;
                },
                contentPadding: const EdgeInsets.all(0),
                leading: Image.asset(viewer1),
                title: const Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: const Text(
                  'john_doe',
                  style: TextStyle(
                    color: Color(0xFF86878B),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: SizedBox(
                  width: Get.width * .10,
                  child: Obx(
                    () => profileController.selectedindex.value == 0
                        ? const Icon(
                            Icons.check,
                            color: primaryColor,
                          )
                        : Container(),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  profileController.selectedindex.value = 1;
                },
                contentPadding: const EdgeInsets.all(0),
                leading: Image.asset(viewer2),
                title: const Text(
                  'Courtney Henry',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: const Text(
                  'courtney_henry',
                  style: TextStyle(
                    color: Color(0xFF86878B),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: SizedBox(
                  width: Get.width * .10,
                  child: Obx(
                    () => profileController.selectedindex.value == 1
                        ? const Icon(
                            Icons.check,
                            color: primaryColor,
                          )
                        : Container(),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  profileController.selectedindex.value = 2;
                },
                contentPadding: const EdgeInsets.all(0),
                leading: Image.asset(viewer3),
                title: const Text(
                  'Ralph Edwards',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: const Text(
                  'Ralph_edwards',
                  style: TextStyle(
                    color: Color(0xFF86878B),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: SizedBox(
                  width: Get.width * .10,
                  child: Obx(
                    () => profileController.selectedindex.value == 2
                        ? const Icon(
                            Icons.check,
                            color: primaryColor,
                          )
                        : Container(),
                  ),
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(120),
                      color: lightpinkColor),
                  child: const Icon(
                    Icons.add,
                    color: primaryColor,
                  ),
                ),
                title: const Text(
                  'Add Account',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ]),
          ),
        ),
        isScrollControlled: true,
        clipBehavior: Clip.none);
  }

  Widget menu() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: Get.height * .80,
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
                borderRadius: BorderRadius.circular(15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    video1,
                    height: 270,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
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
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(40.0)), //this right here
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
}
