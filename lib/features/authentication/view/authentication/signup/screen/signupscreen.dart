import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/features/authentication/view/authentication/birthdayPage/screen/birthdayscreen.dart';
import 'package:tiktok/features/authentication/view/authentication/login/screen/loginscreen.dart';
import 'package:tiktok/utils/custom_widget/primarybutton.dart';
import 'package:tiktok/utils/images.dart';

import '../../../../../../utils/color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whitecolor,
        surfaceTintColor: whitecolor,
        elevation: 0,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.close_sharp)),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Text(
            'Sign up for TokTik',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Create a profile, follow other accounts, make \nyour own videos, and more.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: greyColor,
              fontSize: 18,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          authwidget(
              icon: call,
              title: 'Use Phone / email ',
              ontap: () {
                Get.to(() => const BirthDayScreen());
              }),
          authwidget(icon: google, title: 'Login With Google', ontap: () {}),
          authwidget(
              icon: facebook, title: 'Login With Facebook', ontap: () {}),
          authwidget(
              icon: twitter, title: 'Login With Twitter', ontap: () {}),
          const SizedBox(
            height: 20,
          ),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'By continuing, you agree to our ',
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Terms of Service',
                  style: TextStyle(
                    color: blackcolor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' and\nacknowledge that you have read our ',
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(
                    color: blackcolor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text:
                      ' to\nlearn how we collect, use, and share your date.',
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          // const Spacer(),
          PrimaryButton(
              ontap: () {
                Get.to(() => const LoginScreen());
              },
              title: "Already have an account? Log in"),
          const SizedBox(
            height: 10,
          )
        ]),
      ),
    );
  }

  Widget authwidget(
      {required String title,
      required String icon,
      required void Function()? ontap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 9),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: lightborderColor)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 70,
              ),
              SvgPicture.asset(
                icon,
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF161722),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
