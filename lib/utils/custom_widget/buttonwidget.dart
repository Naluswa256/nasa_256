import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  String buttontitle;
  Color? buttoncolor = primaryColor;
  void Function()? ontap;
  ButtonWidget(
      {super.key,
      required this.buttontitle,
      required this.ontap,
      this.buttoncolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: whitecolor,
        border: Border.all(color: greyEB),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            height: 7,
          ),
          GestureDetector(
            onTap: ontap,
            child: Container(
              width: Get.width * .90,
              height: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: buttoncolor ?? primaryColor,
              ),
              child: Center(
                child: Text(
                  buttontitle,
                  style: const TextStyle(
                      fontSize: 22,
                      color: whitecolor,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
