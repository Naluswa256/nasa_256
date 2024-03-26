import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/searchcontroller.dart';

class SoundScreen extends StatefulWidget {
  const SoundScreen({super.key});

  @override
  State<SoundScreen> createState() => _SoundScreenState();
}

class _SoundScreenState extends State<SoundScreen> {
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
              itemBuilder: (context, index) => soundWidget(index),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    ));
  }

  Widget soundWidget(index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        leading: Image.asset(searchScreenController.musicimages[index]),
        title: Text(
          searchScreenController.musicname[index],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Brooklyn Grande',
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
}
