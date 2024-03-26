import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/color.dart';

import '../controller/searchcontroller.dart';

class HashtagScreen extends StatefulWidget {
  const HashtagScreen({super.key});

  @override
  State<HashtagScreen> createState() => _HashtagScreenState();
}

class _HashtagScreenState extends State<HashtagScreen> {
  SearchScreenController searchScreenController =
      Get.put(SearchScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * .70,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: searchScreenController.musicimages.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => hashtagWidget(index),
            ),
          ),
        ],
      ),
    ));
  }

  Widget hashtagWidget(index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: lightpinkColor),
          child: const Center(
            child: Text(
              "#",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: primaryColor),
            ),
          ),
        ),
        title: Text(
          searchScreenController.hashtaglist[index],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: const Text(
          '99.36M',
          style: TextStyle(
            color: Color(0xFF86878B),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
