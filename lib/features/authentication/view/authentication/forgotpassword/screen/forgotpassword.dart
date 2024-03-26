import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/features/authentication/view/authentication/login/screen/loginscreen.dart';
import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/custom_widget/buttonwidget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reset',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: blackcolor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(children: [
                const Text(
                  'Forgot password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: blackcolor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'We’ll email you a code to reset your\npassword.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF86878B),
                    fontSize: 18,
                    fontFamily: 'Proxima Nova',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  onChanged: (val) {
                    setState(() {});
                  },
                  controller: emailcontroller,
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
                    labelText: "Email address",
                    labelStyle: const TextStyle(
                      color: greyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ]),
            ),
          ),
          ButtonWidget(
              buttontitle: "Reset",
              ontap: () {
                Get.off(() => const LoginScreen());
              })
        ],
      ),
    );
  }
}
