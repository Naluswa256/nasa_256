import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get_storage/get_storage.dart';
import 'package:tiktok/screens/bottomnavigation/screen/bottomnavigationscreen.dart';
import 'package:tiktok/utils/custom_widget/buttonwidget.dart';

import '../../../../../../utils/color.dart';

class CreateUserName extends StatefulWidget {
  const CreateUserName({super.key});

  @override
  State<CreateUserName> createState() => _CreateUserNameState();
}

class _CreateUserNameState extends State<CreateUserName> {
  TextEditingController usernamecontroller = TextEditingController();
  bool isselected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Sign up',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF161722),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: InkWell(
              onTap: () {
                Get.offAll(() => const BottomNavigation());
            //    GetStorage().write('issignin', 1);
              },
              child: const Text(
                'Skip',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFEA4359),
                  fontSize: 20,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
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
                        'Create username',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'you can always change this later.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF86878B),
                          fontSize: 18,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: usernamecontroller,
                      onChanged: (val) {
                        setState(() {
                          usernamecontroller.text.isEmpty
                              ? isselected = false
                              : true;
                        });
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        color: blackcolor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        suffix: isselected
                            ? const Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : Container(),
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
                        hintText: "Username",
                        hintStyle: const TextStyle(
                          color: lightborderColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Suggested',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      usernamecontroller.text = "john_123";
                                      isselected = true;
                                    });
                                  },
                                  child: Container(
                                    height: 33,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: lightborderColor),
                                        borderRadius:
                                            BorderRadius.circular(44)),
                                    child: const Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Text(
                                          'john_123',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: blackcolor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                    )
                  ]),
            ),
          ),
          ButtonWidget(
            buttontitle: "Sign up",
            ontap: () {
              Get.offAll(() => const BottomNavigation());
             // GetStorage().write('issignin', 1);
            },
            buttoncolor: usernamecontroller.text.isNotEmpty
                ? primaryColor
                : lightpinkColor,
          )
        ],
      ),
    );
  }
}
