import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';
import '../controller/followercontroller.dart';
import 'searchscreen.dart';

class FollowerScreen extends StatefulWidget {
  const FollowerScreen({super.key});

  @override
  State<FollowerScreen> createState() => _FollowerScreenState();
}

class _FollowerScreenState extends State<FollowerScreen> {
  FollowerController followerController = Get.put(FollowerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'craig_love',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const SearchScreen());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Column(children: [
        BottomAppBar(
          surfaceTintColor: whitecolor,
          height: 50,
          padding: EdgeInsets.zero,
          color: whitecolor,
          child: Center(
            child: TabBar(
              tabAlignment: TabAlignment.center,
              isScrollable: true,
              controller: followerController.controller1,
              dividerColor: lightborderColor,
              indicatorColor: primaryColor,
              tabs: followerController.myTabs,
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
          height: Get.height * .80,
          color: whitecolor,
          child: TabBarView(
            controller: followerController.controller1,
            children: [followerwidget(), followingwidget(), suggestedWidget()],
          ),
        ),
      ]),
    );
  }

  Widget followerwidget() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: followerController.viewer.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          dense: true,
          leading: Image.asset(followerController.viewer[index]),
          title: Text(
            followerController.viewernamelist[index],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            followerController.viewersubnamelist[index],
            style: const TextStyle(
              color: Color(0xFF86878B),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: GestureDetector(
            onTap: () {
              if (followerController.followlist.contains(index)) {
                setState(() {
                  followerController.followlist.remove(index);
                });
              } else {
                setState(() {
                  followerController.followlist.add(index);
                });
              }
            },
            child: followerController.followlist.contains(index)
                ? Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor, width: 1.2),
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
    );
  }

  Widget suggestedWidget() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: followerController.viewer.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
        child: ListTile(contentPadding: const EdgeInsets.all(0),
          
          dense: true,
          leading: Image.asset(followerController.viewer[index]),
          title: Text(
            followerController.viewernamelist[index],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            followerController.viewersubnamelist[index],
            style: const TextStyle(
              color: Color(0xFF86878B),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: SizedBox(
            width: Get.width * .31,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (followerController.followlist.contains(index)) {
                      setState(() {
                        followerController.followlist.remove(index);
                      });
                    } else {
                      setState(() {
                        followerController.followlist.add(index);
                      });
                    }
                  },
                  child: followerController.followlist.contains(index)
                      ? Container(
                          width: 65,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: primaryColor, width: 1.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Following',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          width: 60,
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
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.close,
                      color: greyColor,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget followingwidget() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: followerController.viewer.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          dense: true,
          leading: Image.asset(followerController.viewer[index]),
          title: Text(
            followerController.viewernamelist[index],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            followerController.viewersubnamelist[index],
            style: const TextStyle(
              color: Color(0xFF86878B),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: GestureDetector(
            onTap: () {
              if (followerController.followlist.contains(index)) {
                setState(() {
                  followerController.followlist.remove(index);
                });
              } else {
                setState(() {
                  followerController.followlist.add(index);
                });
              }
            },
            child: followerController.followlist.contains(index)
                ? Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor, width: 1.2),
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
    );
  }
}
