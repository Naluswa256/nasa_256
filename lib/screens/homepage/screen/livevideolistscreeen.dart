import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/images.dart';

import '../controller/searchcontroller.dart';

class LiveVideoListScreen extends StatefulWidget {
  const LiveVideoListScreen({super.key});

  @override
  State<LiveVideoListScreen> createState() => _LiveVideoListScreenState();
}

class _LiveVideoListScreenState extends State<LiveVideoListScreen> {
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
                    childAspectRatio:height < 700 ? .52: .57,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 5.0),
                itemBuilder: (context, index) => videoWidget(index),
              ),
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
                height: 270,
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Row(
                children: [
                  Container(
                    height: 24,
                    width: 53,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        'LIVE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 24,
                    width: 59,
                    decoration: BoxDecoration(
                        color: liveboxcolor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.group,
                          color: whitecolor,
                          size: 14,
                        ),
                        Text(
                          '3.6K',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
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
