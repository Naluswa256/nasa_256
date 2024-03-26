import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';
import '../controller/datasavercontroller.dart';

class DataSaverScreen extends StatefulWidget {
  const DataSaverScreen({super.key});

  @override
  State<DataSaverScreen> createState() => _DataSaverScreenState();
}

class _DataSaverScreenState extends State<DataSaverScreen> {
  DataSaverController dataSaverController = Get.put(DataSaverController());
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
          'Date Saver',
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
                "Date Saver",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Obx(
                () => Switch(
                  value: dataSaverController.datasaverswitch.value,
                  onChanged: (val) {
                    dataSaverController.datasaverswitch.value = val;
                  },
                  activeColor: whitecolor,
                  inactiveTrackColor: lightborderColor,
                  inactiveThumbColor: whitecolor,
                  activeTrackColor: primaryColor,
                ),
              ),
            ),
            const Text(
              'Reduce yourdata consumption when using cellular data.\nVideos may be at lower resolution or take longer to\nload. This won’t apply when you’re on Wi-Fi.',
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
