import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/color.dart';

class FreeUpSpaceScreen extends StatefulWidget {
  const FreeUpSpaceScreen({super.key});

  @override
  State<FreeUpSpaceScreen> createState() => _FreeUpSpaceScreenState();
}

class _FreeUpSpaceScreenState extends State<FreeUpSpaceScreen> {
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
          'Free up space',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Cache: 88.8MB',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Clear your cache to free up space. This won’t affect your\nTokTik experience.',
            style: TextStyle(
              color: greyColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 24,
            width: 72,
            decoration: BoxDecoration(
              color: lightpinkColor,
              border: Border.all(
                color: primaryColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Text(
                'Clear',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Downloads: 201.5MB',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Downloads may include effects, filters, stickers, and virtual gifts downloaded in your app. You’ll be able to download them again if you need them.',
            style: TextStyle(
              color: greyColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 24,
            width: 72,
            decoration: BoxDecoration(
              color: lightpinkColor,
              border: Border.all(
                color: primaryColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Text(
                'Clear',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Drafts: 3.2MB',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'You can publish your draft posts to free up space on your Phone.',
            style: TextStyle(
              color: greyColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 24,
            width: 72,
            decoration: BoxDecoration(
              color: lightpinkColor,
              border: Border.all(
                color: primaryColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Text(
                'Manage',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
