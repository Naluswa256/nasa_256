import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/screens/profile/controller/editprofilecontroller.dart';

import '../../../utils/color.dart';
import '../../../utils/images.dart';
import 'nameeditscreen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileController editProfileController =
      Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
            onTap: () {
              changephoto();
            },
            child: Align(
              alignment: Alignment.center,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 116,
                    height: 116,
                    decoration: const ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(profilepic),
                        fit: BoxFit.fill,
                      ),
                      shape: OvalBorder(),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: -0,
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: primaryColor),
                      child: const Center(
                        child: Icon(
                          Icons.edit,
                          size: 18,
                          color: whitecolor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 1.2,
            width: Get.width,
            color: lightborderColor,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'About You',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 170,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: editProfileController.icondata.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  if (index == 0) {
                    Get.to(() => const NameEditScreen());
                  }
                },
                contentPadding: const EdgeInsets.all(0),
                leading: Icon(
                  index == 0
                      ? Icons.person_outline_rounded
                      : index == 1
                          ? Icons.check_circle_outline
                          : Icons.info_outline,
                  color: primaryColor,
                ),
                title: Text(
                  editProfileController.icondata[index]['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: SizedBox(
                  width: width <400 ? width*.30 : Get.width * .25,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                      editProfileController.icondata[index]['sub'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: greyColor,
                    )
                  ]),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 1.2,
            width: Get.width,
            color: lightborderColor,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Social',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: editProfileController.socialdata.length,
              itemBuilder: (context, index) => ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: SvgPicture.asset(
                  editProfileController.socialdata[index]['icon'],
                  color: primaryColor,
                ),
                title: Text(
                  editProfileController.socialdata[index]['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: SizedBox(
                  width:  width <400 ? width*.36 : Get.width * .33,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                      editProfileController.socialdata[index]['sub'],
                      style: const TextStyle(
                        fontSize: 16,
                        color: greyColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: greyColor,
                    )
                  ]),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  changephoto() {
    Get.bottomSheet(
        Container(
          width: Get.width,
          height: Get.height * .60,
          decoration: const BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(children: [
            const SizedBox(
              height: 75,
              child: Center(
                child: Text(
                  'Change Photo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: blackcolor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              color: lightborderColor,
              height: 1.2,
              width: Get.width,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 70,
              width: Get.width,
              child: const Center(
                child: Text(
                  'Take Photo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                color: lightborderColor,
                height: 0.8,
                width: Get.width,
              ),
            ),
            SizedBox(
              height: 70,
              width: Get.width,
              child: const Center(
                child: Text(
                  'Select from Gallery',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                color: lightborderColor,
                height: 0.8,
                width: Get.width,
              ),
            ),
            SizedBox(
              height: 70,
              width: Get.width,
              child: const Center(
                child: Text(
                  'View Photo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                color: lightborderColor,
                height: 0.8,
                width: Get.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: 70,
                width: Get.width,
                child: const Center(
                  child: Text(
                    'Cancel',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
        isScrollControlled: true,
        clipBehavior: Clip.none);
  }
}
