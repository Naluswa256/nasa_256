import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/features/authentication/view/authentication/login/screen/loginscreen.dart';
import 'package:tiktok/utils/color.dart';

import '../controller/profilecontroller.dart';

class ProfileLoginScreen extends StatefulWidget {
  const ProfileLoginScreen({super.key});

  @override
  State<ProfileLoginScreen> createState() => _ProfileLoginScreenState();
}

class _ProfileLoginScreenState extends State<ProfileLoginScreen> {
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.person_solid,
              size: 120,
              color: greyColor,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Sign up for an account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF86878B),
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            IconButton(
              onPressed: () {
                Get.to(() => const LoginScreen());
              },
              icon: Container(
                width: 248,
                height: 58,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: primaryColor),
                child: const Center(
                  child: Text(
                    'Sign up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
