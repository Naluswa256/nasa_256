import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tiktok/core/helpers/util.dart';
import 'package:tiktok/features/authentication/bloc/auth_bloc.dart';
import 'package:tiktok/features/authentication/bloc/authentication_state.dart';
import 'package:tiktok/features/authentication/view/authentication/login/screen/verify_phone_number_screen.dart';
import 'package:tiktok/features/authentication/view/authentication/signup/screen/otpscreen.dart';
import 'package:tiktok/screens/bottomnavigation/screen/bottomnavigationscreen.dart';
import 'package:tiktok/utils/custom_widget/buttonwidget.dart';
import 'package:easy_container/easy_container.dart';
import '../../../../../../utils/color.dart';
import '../../forgotpassword/screen/forgotpassword.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class LoginMobileEmailScreen extends StatefulWidget {
  const LoginMobileEmailScreen({super.key});

  @override
  State<LoginMobileEmailScreen> createState() => _LoginMobileEmailScreenState();
}

class _LoginMobileEmailScreenState extends State<LoginMobileEmailScreen> {
  final TextEditingController __emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _mobileController = TextEditingController();
  // final TextEditingController _phoneController = TextEditingController();
  int _selectedIndex = 0; 
  String? phoneNumber;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          title: const Text(
            'Log in',
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(children: [
                      headwidget(),
                      const SizedBox(
                        height: 30,
                      ),
                      _selectedIndex == 0 ? phoneWidget(): emailWidget(),
                    ]),
                  ),
                ),
              ),
            ),
             BlocConsumer<AuthenticationCubit, AuthenticationState>(
                          listener: (context, state) {
                            if (state is AuthenticationFailure) {
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
                                            } else if (state is AppAutheticated) {
                              Get.offAll(() => const BottomNavigation());
                            }
                          },
                          builder: (context, state) {
                            return ButtonWidget(
                              buttoncolor: (__emailController.text.isNotEmpty &&
                                      _passwordController.text.isNotEmpty) ||
                                  (_selectedIndex == 0)
                                  ? primaryColor
                                  : lightpinkColor,
                              buttontitle: _selectedIndex == 0 ? "Send Code" : "Log in",
                              ontap: () {
                                if (_selectedIndex == 0) {
                                  // Send code functionality (assuming implemented)
                                              if (
                                !_formKey.currentState!.validate()) {
                              showSnackBar('Please enter a valid phone number!');
                            } else {
                              Get.to(()=>  VerifyPhoneNumberScreen(phoneNumber:phoneNumber!));
                            }
                                } else {
                                  context
                                      .read<AuthenticationCubit>().convertAnonymousToEmailAndPassword(__emailController.text, _passwordController.text);
                                }
                              },
                            );
                          },
                        ),

          ],
        ),
      ),
    );
  }

  Widget phoneWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // countrypicker(),
        // const SizedBox(height: 30,),
        // bottomwidget()
        EasyContainer(
                elevation: 0,
                borderRadius: 10,
                color: Colors.transparent,
                child: Form(
                  key: _formKey,
                  child: IntlPhoneField(
                    autofocus: true,
                    invalidNumberMessage: 'Invalid Phone Number!',
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(fontSize: 18),
                    onChanged: (phone) => phoneNumber = phone.completeNumber,
                    initialCountryCode: 'IN',
                    flagsButtonPadding: const EdgeInsets.only(right: 10),
                    showDropdownIcon: false,
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),
      ],
    );
  }

  Widget emailWidget() {
    return Column(
      children: [
        TextField(
          onChanged: (val) {
            setState(() {});
          },
          controller: __emailController,
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
              color: blackcolor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          onChanged: (val) {
            setState(() {});
          },
          controller: _passwordController,
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
            labelText: "Password",
            labelStyle: const TextStyle(
              color: blackcolor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            choosewidget();
          },
          child: const Text(
            'Forgot password?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  choosewidget() {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: SizedBox(
                height: 120,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () {
                          Get.to(() => OtpScreen(isfromforgort: true));
                        },
                        leading: const Text(
                          'Phone Number',
                          style: TextStyle(
                            color: blackcolor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.to(() => const ForgotPasswordScreen());
                        },
                        leading: const Text(
                          'Email',
                          style: TextStyle(
                            color: blackcolor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget bottomwidget() {
    return Column(
      children: [
        TextField(
          onChanged: (val) {
            setState(() {});
          },
         // controller: _mobileController,
          keyboardType: TextInputType.phone,
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
            labelText: "Mobile Number",
            labelStyle: const TextStyle(
              color: blackcolor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget headwidget() {
    return Container(
      width: 275,
      height: 48,
      decoration: BoxDecoration(
          color: lightpinkColor, borderRadius: BorderRadius.circular(40)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                _selectedIndex = 0;
                  
                });
              },
              child: Container(
                width: 130,
                height: 36,
                decoration: BoxDecoration(
                    boxShadow: [
                      _selectedIndex == 0
                          ? const BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 2,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          : const BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 0.0,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                    ],
                    borderRadius: BorderRadius.circular(40),
                    color: _selectedIndex == 0
                        ? primaryColor
                        : lightpinkColor),
                child: Center(
                  child: Text(
                    'Phone',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _selectedIndex == 0
                          ? whitecolor
                          : blackcolor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            
             GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex= 1;
                }); 
                  
              },
              child: Container(
                width: 130,
                height: 36,
                decoration: BoxDecoration(
                    boxShadow: [
                      _selectedIndex == 1
                          ? const BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 2,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          : const BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 0.0,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                    ],
                    borderRadius: BorderRadius.circular(40),
                    color: _selectedIndex == 1
                        ? primaryColor
                        : lightpinkColor),
                child: Center(
                  child: Text(
                    'Email/username',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _selectedIndex == 1
                          ? whitecolor
                          : blackcolor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget countrypicker() {
    
    return SizedBox(
      height: 55,
      width: Get.height * 0.15,
      child: Form(
        key: _formKey,
        child: IntlPhoneField(
          
        //  controller: _phoneController,
          textInputAction: TextInputAction.done,
          showDropdownIcon: false,
          showCountryFlag: true,
          disableLengthCheck: true,
          dropdownTextStyle: const TextStyle(fontFamily: "OpenSans"),
          style: const TextStyle(fontFamily: "OpenSans", fontSize: 15),
          initialCountryCode: 'IN',
        showCursor: false,
          readOnly: true,
          decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: lightborderColor),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: lightborderColor),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: lightborderColor),
                borderRadius: BorderRadius.circular(20)),
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: lightborderColor),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onChanged: (phone) => phoneNumber = phone.completeNumber,
        ),
      ),
    );
  }
}





