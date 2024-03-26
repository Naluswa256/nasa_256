import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tiktok/core/di/locator.dart';
import 'package:tiktok/features/authentication/bloc/auth_bloc.dart';
import 'package:tiktok/features/authentication/bloc/authentication_state.dart';
import 'package:tiktok/features/authentication/view/authentication/swipePage/screen/swipeupscreen.dart';
import 'package:tiktok/screens/bottomnavigation/screen/bottomnavigationscreen.dart';

import 'package:tiktok/utils/custom_widget/buttonwidget.dart';

import '../../../../../../utils/color.dart';
import '../../../../../../utils/custom_widget/choose_interest.dart';
import '../controller/chooseinterestcontroller.dart';

class ChooseYourInterestScreen extends StatefulWidget {
  const ChooseYourInterestScreen({super.key});

  @override
  State<ChooseYourInterestScreen> createState() =>
      _ChooseYourInterestScreenState();
}

class _ChooseYourInterestScreenState extends State<ChooseYourInterestScreen> {
  ChooseInterestController interestcontroller =
      Get.put(ChooseInterestController());
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
          body: SizedBox(
            height: Get.height,
            child: Stack(
              // alignment: Alignment.bottomCenter,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Choose Your \nInterests',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Get personalized video recommendations',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 16,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      itemSelection(),
                      const SizedBox(
                        height: 120,
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: state is AuthenticationLoading
                      ? const CircularProgressIndicator()
                      : ButtonWidget(
                          buttontitle: "Next",
                          ontap: () {
                            List<String> selectedTitles = interestcontroller
                                .selectedList
                                .map<String>((interest) => interest.title!)
                                .toList();
                            // Call signInAnonymously with the selected titles
                            authenticationCubit
                                .signInAnonymously(selectedTitles);
                          }),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget itemSelection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: interestcontroller.itemList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 0.65,
            crossAxisSpacing: 15,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return GridItem(
            item: interestcontroller.itemList[index],
            isSelected: (bool value) {
              if (value) {
                if (interestcontroller.selectedList.length != 5) {
                  interestcontroller.selectedList
                      .add(interestcontroller.itemList[index]);
                }
              } else {
                interestcontroller.selectedList
                    .remove(interestcontroller.itemList[index]);
              }
            },
            selectedLength: interestcontroller.selectedList.length,
          );
        },
      ),
    );
  }
}
