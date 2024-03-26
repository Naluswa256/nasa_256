// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color.dart';

class PrimaryButton extends StatelessWidget {
  void Function()? ontap;

  String title;
  PrimaryButton({super.key, required this.ontap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: Get.width * .90,
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: primaryColor,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 18, color: whitecolor, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
