import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/screens/discover/controller/discovercontroller.dart';
import 'package:tiktok/utils/images.dart';

import '../../../utils/color.dart';

import '../../homepage/screen/usesoundscreen.dart';
import 'trendinghashtag.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  DiscoverController discoverController = Get.put(DiscoverController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            SvgPicture.asset(toktik),
            BottomAppBar(
              surfaceTintColor: whitecolor,
              height: 50,
              padding: EdgeInsets.zero,
              color: whitecolor,
              child: Center(
                child: TabBar(
                  tabAlignment: TabAlignment.center,
                  isScrollable: false,
                  controller: discoverController.controller1,
                  dividerColor: lightborderColor,
                  indicatorColor: primaryColor,
                  tabs: discoverController.myTabs,
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
                controller: discoverController.controller1,
                children: [
                  soundWidget(),
                  hashtagWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  hashtagWidget() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
              onTap: () {
                Get.to(() => const TrendingHashtag());
              },
              child: hashtagWidget1(music1, "amazingfood")),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: 5,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    videoWidget(index, discoverController.foodlist)),
          ),
          const SizedBox(
            height: 5,
          ),
          hashtagWidget1(music1, "beautifulgirl"),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: 5,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    videoWidget(index, discoverController.userimage)),
          ),
          const SizedBox(
            height: 5,
          ),
          hashtagWidget1(music1, "Songforyou"),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: 5,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    videoWidget(index, discoverController.userimage)),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  Widget soundWidget() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
              onTap: () {
                Get.to(() => const UseSoundScreen());
              },
              child: favouriteWidget(music1, "Favorite Girl")),
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: 5,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    videoWidget(index, discoverController.userimage)),
          ),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
              onTap: () {
                Get.to(() => const UseSoundScreen());
              },
              child: favouriteWidget(food, "Favourite Girl")),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 5,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  videoWidget(index, discoverController.foodlist),
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  Widget favouriteWidget(String image, String name) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Image.asset(image),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Justin Bieber',
            style: TextStyle(
              color: Color(0xFF86878B),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            '01:00',
            style: TextStyle(
              color: Color(0xFF86878B),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      trailing: SizedBox(
        width: Get.width * .20,
        child: const Row(
          children: [
            Text(
              '122.1M',
              style: TextStyle(
                color: Color(0xFF86878B),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
              color: primaryColor,
            )
          ],
        ),
      ),
    );
  }

  Widget hashtagWidget1(String image, String name) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: lightpinkColor),
        child: const Center(
          child: Text(
            "#",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w900, color: primaryColor),
          ),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending Hashtag',
            style: TextStyle(
              color: Color(0xFF86878B),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      trailing: SizedBox(
        width: Get.width * .20,
        child: const Row(
          children: [
            Text(
              '122.1M',
              style: TextStyle(
                color: Color(0xFF86878B),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
              color: primaryColor,
            )
          ],
        ),
      ),
    );
  }

  Widget videoWidget(int index, List imagelist) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imagelist[index],
                  width: 117,
                  fit: BoxFit.fill,
                  height: 200,
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Row(
                  children: [
                    Image.asset(
                      play,
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
            ],
          ),
        ],
      ),
    );
  }
}
