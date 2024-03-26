import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/images.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'Support',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 60,
              width: Get.width,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 14.0,
                  spreadRadius: 0.0,
                  offset: Offset(
                    0.0,
                    0.0,
                  ),
                )
              ], borderRadius: BorderRadius.circular(20), color: whitecolor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(support1),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Help Center',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: greyColor,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 60,
              width: Get.width,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 14.0,
                  spreadRadius: 0.0,
                  offset: Offset(
                    0.0,
                    0.0,
                  ),
                )
              ], borderRadius: BorderRadius.circular(20), color: whitecolor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(support2),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Safety Center',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: greyColor,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
