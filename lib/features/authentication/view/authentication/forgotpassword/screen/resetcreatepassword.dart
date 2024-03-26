import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/screens/bottomnavigation/screen/bottomnavigationscreen.dart';
import 'package:tiktok/utils/color.dart';

import '../../../../../../utils/custom_widget/buttonwidget.dart';
import '../controller/resetcreatecontroller.dart';

class ResetCreatePassword extends StatefulWidget {
  const ResetCreatePassword({super.key});

  @override
  State<ResetCreatePassword> createState() => _ResetCreatePasswordState();
}

ResetCreatePasswordController resetCreatePasswordController =
    Get.put(ResetCreatePasswordController());

class _ResetCreatePasswordState extends State<ResetCreatePassword> {
  @override
  void initState() {
    setState(() {
      resetCreatePasswordController.passwordcontroller.addListener(() {
        resetCreatePasswordController.passwordlength.value =
            resetCreatePasswordController.passwordcontroller.text.length >= 8 &&
                resetCreatePasswordController.passwordcontroller.text.length <=
                    20;
        resetCreatePasswordController.spedcialcharacter.value =
            resetCreatePasswordController.passwordcontroller.text
                .contains(resetCreatePasswordController.spcharacterReg);
        resetCreatePasswordController.letternumber.value =
            resetCreatePasswordController.passwordcontroller.text
                .contains(resetCreatePasswordController.numberandchar);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'Reset',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: blackcolor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Create password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      controller:
                          resetCreatePasswordController.passwordcontroller,
                      onChanged: (val) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        color: blackcolor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: lightborderColor,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: lightborderColor,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: lightborderColor,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: lightborderColor,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: "Enter password",
                        hintStyle: const TextStyle(
                          color: lightborderColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Your password must have at least:',
                      style: TextStyle(
                        color: blackcolor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => Row(
                        children: [
                          resetCreatePasswordController.passwordlength.value
                              ? const Icon(
                                  Icons.check_circle,
                                  color: primaryColor,
                                )
                              : Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    color: greyEB,
                                    borderRadius: BorderRadius.circular(44),
                                  ),
                                ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            '8 characters (20 max)',
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => Row(
                        children: [
                          resetCreatePasswordController.letternumber.value
                              ? const Icon(
                                  Icons.check_circle,
                                  color: primaryColor,
                                )
                              : Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    color: greyEB,
                                    borderRadius: BorderRadius.circular(44),
                                  ),
                                ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            '1 letter and 1 number',
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => Row(
                        children: [
                          resetCreatePasswordController.spedcialcharacter.value
                              ? const Icon(
                                  Icons.check_circle,
                                  color: primaryColor,
                                )
                              : Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    color: greyEB,
                                    borderRadius: BorderRadius.circular(44),
                                  ),
                                ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            '1 special character (Example: # ? ! \$ & @)',
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
          ButtonWidget(
              buttontitle: "Next",
              ontap: () {
                Get.off(() => const BottomNavigation());
              })
        ],
      ),
    );
  }
}
