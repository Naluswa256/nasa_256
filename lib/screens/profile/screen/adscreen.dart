import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/color.dart';

class AdScreen extends StatefulWidget {
  const AdScreen({super.key});

  @override
  State<AdScreen> createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        backgroundColor: whitecolor,
        surfaceTintColor: whitecolor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'ADS',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Text(
                  'Advertiser settings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: greyColor,
                  size: 16,
                ),
              ),
              const Text(
                'You can hide the ads from an advertiser who has recently\nshown you ads on TokTik.',
                style: TextStyle(
                  color: greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Text(
                  'How your ads are personalized',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: greyColor,
                  size: 16,
                ),
              ),
              const Text(
                'Customize factors used to personalize your ads',
                style: TextStyle(
                  color: greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Text(
                  'Your ad activity',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: greyColor,
                  size: 16,
                ),
              ),
              const Text(
                'Share feedback on ads you engaged with or  purchases\nfrom ads',
                style: TextStyle(
                  color: Color(0xFF86878B),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 0.8,
                width: Get.width,
                color: lightborderColor,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Your Ads Settings',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 0.8,
                width: Get.width,
                color: lightborderColor,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Account Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Icon(
                  Icons.calendar_month_outlined,
                  color: primaryColor,
                ),
                title: Text(
                  'This week',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  'Nov 13, 2022-Nov 19, 2022',
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: greyColor,
                  size: 24,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Text(
                  'Ad Experience Specialist',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: greyColor,
                  size: 16,
                ),
              ),
              const Text(
                'Help us improve your ad experience by taking this\n1-question survey',
                style: TextStyle(
                  color: greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
