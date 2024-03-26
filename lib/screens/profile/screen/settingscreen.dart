import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/screens/SplashPage/splashscreen.dart';
import 'package:tiktok/screens/bottomnavigation/controller/navigationcontroller.dart';
import 'package:tiktok/screens/profile/controller/settingcontroller.dart';
import 'package:tiktok/screens/profile/screen/accountscreen.dart';
import 'package:tiktok/screens/profile/screen/adscreen.dart';
import 'package:tiktok/screens/profile/screen/familypairingscreen.dart';
import 'package:tiktok/screens/profile/screen/reportscreen.dart';
import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/images.dart';
import 'aboutscreen.dart';
import 'accessibilityscreen.dart';
import 'balancescreen.dart';
import 'contentpreference.dart';
import 'datasaveerscreen.dart';
import 'freeupspacescreen.dart';
import 'languagescreen.dart';
import 'livesettingscreen.dart';
import 'notificationscreen.dart';
import 'privacyscreen.dart';
import 'screentimescreen.dart';
import 'securityscreen.dart';
import 'supportscreen.dart';
import 'wallpaperscreen.dart';
import 'watchhistoryscreen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SettingController settingController = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            accounWidget(),
            const SizedBox(
              height: 10,
            ),
            contentWidget(),
            const SizedBox(
              height: 10,
            ),
            cacheWidget(),
            const SizedBox(
              height: 10,
            ),
            supportWidget(),
            const SizedBox(
              height: 10,
            ),
            aboutWidget()
          ]),
        ),
      ),
    );
  }

  Widget accounWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 280,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: settingController.accountlist.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                if (index == 0) {
                  Get.to(() => const AccountScreen());
                } else if (index == 1) {
                  Get.to(() => const PrivacyScreen());
                } else if (index == 2) {
                  Get.to(() => const SecurityScreen());
                } else if (index == 3) {
                  Get.to(() => const BalanceScreen());
                } else if (index == 4) {
                  shareAccountwidget();
                }
              },
              contentPadding: const EdgeInsets.all(0),
              leading: SvgPicture.asset(
                settingController.accountlist[index]['icon'],
                color: primaryColor,
              ),
              title: Text(
                settingController.accountlist[index]['name'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: greyColor,
              ),
            ),
          ),
        ),
        Container(
          height: 0.8,
          width: Get.width,
          color: lightborderColor,
        )
      ],
    );
  }

  shareAccountwidget() {
    Get.bottomSheet(
        Container(
          width: Get.width,
          height: Get.height * .60,
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
                    'Send to',
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
              sendtowidget(),
              const SizedBox(
                height: 15,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 50,
                    width: Get.width * .70,
                    decoration: BoxDecoration(
                        color: greyEB, borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Text(
                        'CANCEL',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
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
        clipBehavior: Clip.none);
  }

  Widget sendtowidget() {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: settingController.sendlist.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            index == 0
                ? Stack(alignment: Alignment.center, children: [
                    SvgPicture.asset(
                      greybox,
                    ),
                    SvgPicture.asset(
                      settingController.sendlist[0]['icon'],
                    )
                  ])
                : SvgPicture.asset(
                    settingController.sendlist[index]['icon'],
                    fit: BoxFit.fill,
                  ),
            Text(
              settingController.sendlist[index]['name'],
              style: const TextStyle(
                color: Color(0xFF161722),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget supportWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Support & About',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 170,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: settingController.supportlist.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                if (index == 0) {
                  Get.to(() => const ReportProblemScreen());
                } else if (index == 1) {
                  Get.to(() => const SupportScreen());
                } else if (index == 2) {
                  Get.to(() => const AboutScreen());
                }
              },
              contentPadding: const EdgeInsets.all(0),
              leading: SvgPicture.asset(
                settingController.supportlist[index]['icon'],
                color: primaryColor,
              ),
              title: Text(
                settingController.supportlist[index]['name'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: greyColor,
              ),
            ),
          ),
        ),
        Container(
          height: 0.8,
          width: Get.width,
          color: lightborderColor,
        )
      ],
    );
  }

  logoutWidget() {
    Get.bottomSheet(Container(
      width: Get.width,
      height: Get.height * .35,
      decoration: const BoxDecoration(
          color: whitecolor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(
              height: 75,
              child: Center(
                child: Text(
                  'Logout',
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
              height: 20,
            ),
            const Text(
              'Are you sure you want to log out?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Container(
                    height: 58,
                    width: Get.width * .35,
                    decoration: BoxDecoration(
                        color: lightpinkColor,
                        borderRadius: BorderRadius.circular(32)),
                    child: const Center(
                      child: Text(
                        'Cancel',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(() => const SplashScreen());
                    Get.delete<BottomNavigationController>();
                  },
                  icon: Container(
                    height: 58,
                    width: Get.width * .35,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(32)),
                    child: const Center(
                      child: Text(
                        'Logout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: whitecolor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }

  changeAccountwidget() {
    Get.bottomSheet(
        Container(
          width: Get.width,
          height: Get.height * .60,
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
              SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: settingController.switchaccount.length,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      settingController.selectedindex.value = index;
                    },
                    contentPadding: const EdgeInsets.all(0),
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          settingController.switchaccount[index]['img'],
                          height: 50,
                          width: 50,
                        )),
                    title: Text(
                      settingController.switchaccount[index]['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      settingController.switchaccount[index]['id'],
                      style: const TextStyle(
                        color: Color(0xFF86878B),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: SizedBox(
                      width: Get.width * .10,
                      child: Obx(
                        () => settingController.selectedindex.value == index
                            ? const Icon(
                                Icons.check,
                                color: primaryColor,
                              )
                            : Container(),
                      ),
                    ),
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

  Widget aboutWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Support & About',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: settingController.aboutlist.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                if (index == 0) {
                  changeAccountwidget();
                } else {
                  logoutWidget();
                }
              },
              contentPadding: const EdgeInsets.all(0),
              leading: SvgPicture.asset(
                settingController.aboutlist[index]['icon'],
                color: primaryColor,
              ),
              title: Text(
                settingController.aboutlist[index]['name'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: greyColor,
              ),
            ),
          ),
        ),
        Container(
          height: 0.8,
          width: Get.width,
          color: lightborderColor,
        )
      ],
    );
  }

  Widget cacheWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cache & Cellular',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 170,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: settingController.cachelist.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                if (index == 0) {
                  Get.to(() => const FreeUpSpaceScreen());
                } else if (index == 1) {
                  Get.to(() => const DataSaverScreen());
                } else if (index == 2) {
                  Get.to(() => const WallPaperScreen());
                }
              },
              contentPadding: const EdgeInsets.all(0),
              leading: SvgPicture.asset(
                settingController.cachelist[index]['icon'],
                color: primaryColor,
              ),
              title: Text(
                settingController.cachelist[index]['name'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: greyColor,
              ),
            ),
          ),
        ),
        Container(
          height: 0.8,
          width: Get.width,
          color: lightborderColor,
        )
      ],
    );
  }

  Widget contentWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Content & Display',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 530,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: settingController.contentlist.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                if (index == 0) {
                  Get.to(() => const NotificationScreen());
                } else if (index == 1) {
                  Get.to(() => const LiveSettingScreen());
                } else if (index == 2) {
                  Get.to(() => const WatchHistoryScreen());
                } else if (index == 3) {
                  Get.to(() => const ContentPreferenceScreen());
                } else if (index == 4) {
                  Get.to(() => const AdScreen());
                } else if (index == 5) {
                  Get.to(() => const LanguageScreen());
                } else if (index == 6) {
                  Get.to(() => const ScrenTimeScreen());
                } else if (index == 7) {
                  Get.to(() => const FamilyPairingScreen());
                } else if (index == 8) {
                  Get.to(() => const AccessibilityScreen());
                }
              },
              contentPadding: const EdgeInsets.all(0),
              leading: SvgPicture.asset(
                settingController.contentlist[index]['icon'],
                color: primaryColor,
              ),
              title: Text(
                settingController.contentlist[index]['name'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: greyColor,
              ),
            ),
          ),
        ),
        Container(
          height: 0.8,
          width: Get.width,
          color: lightborderColor,
        )
      ],
    );
  }
}
