import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/images.dart';

import '../controller/searchcontroller.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  SearchScreenController searchController = Get.put(SearchScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * .75,
              child: GridView.builder(
                  itemCount: searchController.userimage.length,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio:height < 700 ? .55: .60,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 5.0),
                  itemBuilder: (context, index) => videoWidget(index)),
            )
          ],
        ),
      ),
    );
  }

  Widget videoWidget(int index) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                searchController.userimage[index],
                width: Get.width * .45,
                fit: BoxFit.fill,
                height: 250,
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
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                user1,
                height: 24,
                width: 24,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Brooklyn Grande',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      ],
    );
  }
}
