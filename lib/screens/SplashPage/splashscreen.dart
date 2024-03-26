import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/core/di/locator.dart';
import 'package:tiktok/core/localStorage/local_storage.dart';
import 'package:tiktok/features/authentication/view/authentication/interestPage/screen/chooseyourinterest.dart';
import 'package:tiktok/screens/bottomNavigation/screen/bottomnavigationscreen.dart';
import '../../utils/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), _handleNavigation);
  }

  Future<void> _handleNavigation() async {
    final uid = locator<LocalStorageService>().uid;

    if (uid == null) {
      // No UID, handle first time and non-first time scenarios
      Get.offAll(() => const ChooseYourInterestScreen());
      locator<LocalStorageService>().isFirstTime = false; // Set regardless of initial state
    } else {
      // UID exists, navigate to HomeScreen
      Get.offAll(() => const BottomNavigation());
    }
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackcolor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                text: const TextSpan(
                    children: [
                  TextSpan(
                      text: "Eko",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 68,
                          fontFamily: "ProximaNovaAltRegular",
                          color: whitecolor))
                ],
                    ))
          ],
        ),
      ),
    );
  }
}
