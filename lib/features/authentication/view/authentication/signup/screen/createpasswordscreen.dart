import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/features/authentication/view/authentication/signup/controller/passwordcontroller.dart';
import 'package:tiktok/utils/custom_widget/buttonwidget.dart';

import '../../../../../../utils/color.dart';
import 'createusernamescreen.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

PasswordController passwordCont = Get.put(PasswordController());

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  @override
  void initState() {
    setState(() {
      passwordCont.passwordcontroller.addListener(() {
        passwordCont.passwordlength.value =
            passwordCont.passwordcontroller.text.length >= 8 &&
                passwordCont.passwordcontroller.text.length <= 20;
        passwordCont.spedcialcharacter.value = passwordCont
            .passwordcontroller.text
            .contains(passwordCont.spcharacterReg);
        passwordCont.letternumber.value = passwordCont.passwordcontroller.text
            .contains(passwordCont.numberandchar);
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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Sign up',
          textAlign: TextAlign.center,
          style: TextStyle(
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
                      controller: passwordCont.passwordcontroller,
                      onChanged: (val) {
                        setState(() {});
                      },
                      // controller: signUpController.emailcontroller,
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
                          passwordCont.passwordlength.value
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
                          passwordCont.letternumber.value
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
                          passwordCont.spedcialcharacter.value
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
                Get.to(() => const CreateUserName());
              })
        ],
      ),
    );
  }
}
