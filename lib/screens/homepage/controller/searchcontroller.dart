import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tiktok/utils/images.dart';

class SearchScreenController extends GetxController
    with GetTickerProviderStateMixin {
  TextEditingController controller = TextEditingController();
  TabController? controller1;
  List recentlist = [
    "Jane Cooper",
    "Theresa Webb",
    "Cameron Williamson",
    "Albert Flores"
  ];
  List hashtaglist = [
    "ariana",
    "arianagrande",
    "ariana_",
    "ariana_grande",
    "arianarussel",
    "ariana_miles",
    "ariana_floid",
    "arianator",
    "arianamohr"
  ];

  List<String> userimage = [video1, video2, video3, video1, video2, video3];
  List<String> video = [vid1, vid2, vid3, vid4, vid5, vid6];
  List<String> musicimages = [
    music1,
    music2,
    music3,
    music4,
    music5,
    music6,
    music7
  ];

  List<String> musicname = [
    "Ruby Sparks",
    "Love You So",
    "Made You Look",
    "Lollipop",
    "Just Wanna Rock",
    "Funny Song",
    "Rich Flex"
  ];
  List<String> soundimage = [
    sound1,
    sound2,
  ];
  List<String> userimages = [
    user1,
    user2,
    user3,
    user4,
    user5,
    user6,
    user7,
    user8,
    user9
  ];
  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Container(
        color: Colors.white,
        height: 25,
        width: 95,
        child: const Text(
          'Top',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    const Tab(
      child: SizedBox(
        height: 25,
        width: 95,
        child: Text(
          'Users',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    const Tab(
      child: SizedBox(
        height: 25,
        width: 95,
        child: Text(
          'Video',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    const Tab(
      child: SizedBox(
        height: 25,
        width: 95,
        child: Text(
          'Sounds',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    const Tab(
      child: SizedBox(
        height: 25,
        width: 95,
        child: Text(
          'Live',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    const Tab(
      child: SizedBox(
        height: 25,
        width: 95,
        child: Text(
          'Hashtag',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  ];
  List suggestlist = [
    "Brooklyn Simmons",
    "Jerome Bell",
    "Marvin McKinney",
    "Ronald Richards"
  ];

  @override
  void onInit() {
    controller1 = TabController(vsync: this, length: myTabs.length);
    super.onInit();
  }
}
