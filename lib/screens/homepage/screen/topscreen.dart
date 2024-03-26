import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/images.dart';

import '../controller/livecontroller.dart';
import '../controller/searchcontroller.dart';

class TopScreen extends StatefulWidget {
  const TopScreen({super.key});

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  LiveController liveController = Get.put(LiveController());
  SearchScreenController searchScreenController =
      Get.put(SearchScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'User',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) => userWidget()),
              const Text(
                'Videos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: 5,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => videoWidget(index)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Sounds',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) => soundWidget(index)),
            ],
          ),
        ),
      ),
    );
  }

  Widget videoWidget(int index) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          SizedBox(
            height: 195,
            width: 120,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  searchScreenController.userimage[index],
                  width: 120,
                  height: 195,
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Row(
              children: [
                Image.asset(
                  play,
                  height: 12,
                  width: 12,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  '728.5K',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget soundWidget(index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        leading: Image.asset(searchScreenController.soundimage[index]),
        title: const Text(
          'Favorite Girl',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Justin Bieber',
              style: TextStyle(
                color: Color(0xFF86878B),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '01:00',
              style: TextStyle(
                color: Color(0xFF86878B),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        trailing: const Text(
          '122.1M',
          style: TextStyle(
            color: Color(0xFF86878B),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget userWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              user1,
              height: 50,
              width: 50,
            )),
        title: const Text(
          'Brooklyn Grande',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: const Text(
          'arianagrande | 27.3M followers',
          style: TextStyle(
            color: Color(0xFF86878B),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Container(
          height: 30,
          width: 70,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(100)),
          child: const Center(
            child: Text(
              'Follow',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
