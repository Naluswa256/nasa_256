import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tiktok/utils/color.dart';

import '../controller/searchcontroller.dart';
import 'hashtagscreen.dart';
import 'livevideolistscreeen.dart';
import 'soundscreen.dart';
import 'topscreen.dart';
import 'userscreen.dart';
import 'videoscreen.dart';

class SearchDetailScreen extends StatefulWidget {
  const SearchDetailScreen({super.key});

  @override
  State<SearchDetailScreen> createState() => _SearchDetailScreenState();
}

class _SearchDetailScreenState extends State<SearchDetailScreen> {
  SearchScreenController searchController = Get.put(SearchScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            searchWidget(),
            BottomAppBar(
              surfaceTintColor: whitecolor,
              height: 50,
              padding: EdgeInsets.zero,
              color: whitecolor,
              child: Center(
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  controller: searchController.controller1,
                  dividerColor: lightborderColor,
                  indicatorColor: primaryColor,
                  tabs: searchController.myTabs,
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
                controller: searchController.controller1,
                children: const [
                  TopScreen(),
                  UserScreen(),
                  VideoScreen(),
                  SoundScreen(),
                  LiveVideoListScreen(),
                  HashtagScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: Get.width * .75,
            decoration: BoxDecoration(
              border: Border.all(
                  color: searchController.controller.text.isNotEmpty
                      ? primaryColor
                      : Colors.transparent),
              color: searchController.controller.text.isNotEmpty
                  ? lightpinkColor
                  : greyEB,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: searchController.controller,
              onChanged: (val) {
                setState(() {});
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: searchController.controller.text.isNotEmpty
                        ? primaryColor
                        : greyColor,
                  ),
                  hintStyle: const TextStyle(
                    color: Color(0xFFB5C1D1),
                    fontSize: 16,
                    fontFamily: 'Proxima Nova',
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: "Search"),
            )),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        )
      ],
    );
  }
}
