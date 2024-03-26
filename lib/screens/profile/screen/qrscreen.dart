import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/color.dart';
import 'dart:math' as math;
import 'package:tiktok/utils/images.dart';
import 'scanqrscreen.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: whitecolor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Qr Code',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Transform.rotate(
            angle: -math.pi / 4,
            child: IconButton(
              icon: const Icon(
                Icons.send_rounded,
                color: whitecolor,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: whitecolor),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: SvgPicture.asset(qrcode),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    '@john_doe',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: whitecolor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const ScanQrSCreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                height: 58,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: lightpinkColor),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code_scanner_outlined,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Scan QR Code',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
