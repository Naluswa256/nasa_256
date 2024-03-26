import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';
import '../controller/searchcontroller.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
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
              itemCount: searchScreenController.userimages.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => userWidget(index),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    ));
  }

  Widget userWidget(index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              searchScreenController.userimages[index],
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
