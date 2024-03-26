import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/core/di/locator.dart';
import 'package:tiktok/core/localStorage/local_storage.dart';
import 'package:tiktok/screens/profile/screen/profileloginscreen.dart';
import 'package:tiktok/screens/profile/screen/profilescreen.dart';
import 'package:tiktok/utils/color.dart';
import 'package:tiktok/features/videos/view/video_recording_screen.dart';
import '../../../utils/images.dart';
import '../../addphotos/screen/photosscreen.dart';
import '../../discover/screen/discoverscreen.dart';
import '../../homepage/screen/homescreen.dart';
import '../../inbox/screen/inboxscreen.dart';

import '../controller/navigationcontroller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_bloc/connectivity_bloc.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  
 
  bool? isAuthenticated;
  int pageIndex = 0;
  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    final String? authToken = locator<LocalStorageService>().token;
    setState(() {
      isAuthenticated = authToken != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomeScreen(),
      const DiscoverScreen(),
      const InboxScreen(),
      if (isAuthenticated != null) // Check if a value exists
        isAuthenticated! ? const ProfileScreen() : const ProfileLoginScreen(),
    ];
    return BlocListener<ConnectivityBloc, ConnectivityState>(
        listener: (context, state) {
          if (state is ConnectivityFailureState) {
            showCustomToast('No internet Connection');
          }
        },
        child: Scaffold(
          backgroundColor: whitecolor,
          resizeToAvoidBottomInset: false,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              pages[pageIndex],
              buildMyNavBar(context)
            ],
          ),
        ));
  }

  void showCustomToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomToast(message: message),
        behavior: SnackBarBehavior
            .floating, // Ensures it appears above the bottom navigation bar
        duration: const Duration(seconds: 1), // Adjust duration if needed
      ),
    );
  }
  

  
  Widget buildMyNavBar(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 70,
          decoration: const BoxDecoration(
            color: blackcolor,
            boxShadow: [
              BoxShadow(
                color: greyColor,
                blurRadius: 2,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 68,
                width: Get.width / 5,
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      pageIndex = 0; // Set page index to 0
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          home,
                          color: pageIndex == 0 ? primaryColor : greyEB,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: pageIndex == 0 ? primaryColor : greyEB,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 68,
                width: Get.width / 5,
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      pageIndex = 1; // Set page index to 0
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          discover,
                          color: pageIndex == 1 ? primaryColor : greyEB,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Discover',
                          style: TextStyle(
                            color: pageIndex == 1 ? primaryColor : greyEB,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
               SizedBox(
                height: 68,
                width: Get.width / 5,
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      pageIndex = 2; // Set page index to 0
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          inbox,
                          color: pageIndex == 2 ? primaryColor : greyEB,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Inbox',
                          style: TextStyle(
                            color: pageIndex == 2 ? primaryColor : greyEB,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
               SizedBox(
                height: 68,
                width: Get.width / 5,
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      pageIndex = 3; // Set page index to 0
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          profile,
                          color: pageIndex == 3 ? primaryColor : greyEB,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: pageIndex == 3 ? primaryColor : greyEB,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
        Positioned(
          child: GestureDetector(
            onTap: () async {
              Get.to(() => const VideoRecordingScreen());
            },
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: greyColor,
                    blurRadius: 35,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: SvgPicture.asset(plus),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomToast extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;

  const CustomToast({
    super.key,
    required this.message,
    this.backgroundColor = Colors.grey,
    this.textColor = Colors.white,
    this.fontSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0, // Adjust bottom padding if needed
      left: 0.0,
      right: 0.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            message,
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}
