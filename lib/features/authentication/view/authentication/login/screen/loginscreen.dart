import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/features/authentication/view/authentication/signup/screen/signupscreen.dart';
import 'package:tiktok/utils/custom_widget/primarybutton.dart';
import 'package:tiktok/utils/images.dart';
import 'package:tiktok/core/di/locator.dart';
import 'package:tiktok/features/authentication/bloc/auth_bloc.dart';
import 'package:tiktok/features/authentication/bloc/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../utils/color.dart';
import 'loginmobileandemail.dart';
import 'package:tiktok/screens/bottomnavigation/screen/bottomnavigationscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authenticationCubit = locator<AuthenticationCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      bloc: authenticationCubit,
      listener: (context, state) {
        if (state is AppAutheticated) {
          Get.offAll(() => const BottomNavigation());
        } else if (state is AuthenticationFailure) {
          // Display an error dialog on failure
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('something went Wrong'),
              content: Text(state.message),
              actions: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: whitecolor,
          appBar: AppBar(
            backgroundColor: whitecolor,
            surfaceTintColor: whitecolor,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close_sharp)),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              const Text(
                'Log in to TokTik',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Mange your account, check notifications, \ncomments on videos, and more.',
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
                  title: 'Phone / email',
                  ontap: () {
                    Get.to(() => const LoginMobileEmailScreen());
                  }),
              authwidget(
                  icon: google,
                  title: 'Login With Google',
                  ontap: () {
                    authenticationCubit.convertAnonymousToGoogle();
                  }),
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
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                  ontap: () {
                    Get.to(() => const SignUpScreen());
                  },
                  title: "Don’t have an account? Sign up"),
              const SizedBox(
                height: 10,
              )
            ]),
          ),
        );
      },
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
