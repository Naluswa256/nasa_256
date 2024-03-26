import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/screens/profile/controller/accessibilityscreen.dart';

import '../../../utils/color.dart';

class AccessibilityScreen extends StatefulWidget {
  const AccessibilityScreen({super.key});

  @override
  State<AccessibilityScreen> createState() => _AccessibilityScreenState();
}

class _AccessibilityScreenState extends State<AccessibilityScreen> {
  AccessibilityController accessibilityController =
      Get.put(AccessibilityController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Accessibility',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text(
                "Animated thumbnail",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Obx(
                () => Switch(
                  value: accessibilityController.thumbnail.value,
                  onChanged: (val) {
                    accessibilityController.thumbnail.value = val;
                  },
                  activeColor: whitecolor,
                  inactiveTrackColor: lightborderColor,
                  inactiveThumbColor: whitecolor,
                  activeTrackColor: primaryColor,
                ),
              ),
            ),
            const Text(
              'Photosensitive videos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text(
                "Remove photosensitive video",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Obx(
                () => Switch(
                  value: accessibilityController.removevideo.value,
                  onChanged: (val) {
                    accessibilityController.removevideo.value = val;
                  },
                  activeColor: whitecolor,
                  inactiveTrackColor: lightborderColor,
                  inactiveThumbColor: whitecolor,
                  activeTrackColor: primaryColor,
                ),
              ),
            ),
            const Text(
              'Sound',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text(
                "Auto volume adjustment",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Obx(
                () => Switch(
                  value: accessibilityController.volume.value,
                  onChanged: (val) {
                    accessibilityController.volume.value = val;
                  },
                  activeColor: whitecolor,
                  inactiveTrackColor: lightborderColor,
                  inactiveThumbColor: whitecolor,
                  activeTrackColor: primaryColor,
                ),
              ),
            ),
            const Text(
              'The video volume will be auto-adjusted when you open\nthe app, especially when it is too high. This won’t\naffect your phone volume.',
              style: TextStyle(
                color: greyColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
