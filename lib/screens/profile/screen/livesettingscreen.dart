import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/color.dart';

class LiveSettingScreen extends StatefulWidget {
  const LiveSettingScreen({super.key});

  @override
  State<LiveSettingScreen> createState() => _LiveSettingScreenState();
}

class _LiveSettingScreenState extends State<LiveSettingScreen> {
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
          'LIVE',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 14.0,
                  spreadRadius: 0.0,
                  offset: Offset(
                    0.0,
                    0.0,
                  ),
                )
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Live Events',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  )),
            ),
          )
        ]),
      ),
    );
  }
}
