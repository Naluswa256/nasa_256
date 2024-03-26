import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/color.dart';

import '../../../utils/images.dart';
import '../controller/findfriendcontroller.dart';
import 'scanqrscreen.dart';

class FindFriendsScreen extends StatefulWidget {
  const FindFriendsScreen({super.key});

  @override
  State<FindFriendsScreen> createState() => _FindFriendsScreenState();
}

class _FindFriendsScreenState extends State<FindFriendsScreen> {
  FindFriendController findFriendController = Get.put(FindFriendController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Find Friends',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding:const  EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Get.to(() => const ScanQrSCreen());
              },
              icon: const Icon(
                Icons.qr_code_scanner_outlined,
                color: primaryColor,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width * .90,
                height: 54,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: greyEB),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: greyColor,
                    ),
                    hintText: "Search",
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(120),
                        color: lightpinkColor),
                    child: Center(
                      child: SvgPicture.asset(
                        musicshare,
                        height: 24,
                        width: 24,
                      ),
                    )),
                title: const Text(
                  'Invite Friends',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: const Text(
                  'Stay connected with friends',
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Container(
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: primaryColor),
                  child: const Center(
                    child: Text(
                      'Invite',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
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
                    child: const Center(
                        child: Icon(
                      Icons.group,
                      color: primaryColor,
                    ))),
                title: const Text(
                  'Contacts',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: const Text(
                  'Find your contacts',
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Container(
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: primaryColor),
                  child: const Center(
                    child: Text(
                      'Find',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
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
                    child: Center(
                      child: SvgPicture.asset(
                        post8,
                        height: 24,
                        width: 24,
                      ),
                    )),
                title: const Text(
                  'Facebook Friends',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: const Text(
                  'Find friends of Facebook',
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Container(
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: primaryColor),
                  child: const Center(
                    child: Text(
                      'Find',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
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
                    child: Center(
                      child: SvgPicture.asset(
                        post7,
                        height: 24,
                        width: 24,
                      ),
                    )),
                title: const Text(
                  'Instagram Friends',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: const Text(
                  'Find friends of Instagram',
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Container(
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: primaryColor),
                  child: const Center(
                    child: Text(
                      'Find',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Suggested Accounts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: Get.height,
                child: ListView.builder(
                  itemCount: findFriendController.findfriendlist.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading:
                        Image.asset(findFriendController.findfriendlist[index]),
                    title: Text(
                      findFriendController.findfriendname[index],
                      style:  TextStyle(
                        fontSize: width< 400 ? 15 :18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: const Text(
                      'dianne_russell | 94.63M',
                      style: TextStyle(
                        color: Color(0xFF86878B),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: SizedBox(
                      width: Get.width * .25,
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: width< 400 ? 60 :70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: primaryColor),
                            child: const Center(
                              child: Text(
                                'Follow',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.close,
                            color: greyColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
