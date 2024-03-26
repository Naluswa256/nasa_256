import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/screens/profile/controller/languagecontroller.dart';
import 'package:tiktok/utils/color.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  LanguageController languageController = Get.put(LanguageController());
  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        backgroundColor: whitecolor,
        surfaceTintColor: whitecolor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Language',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Suggested',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              RadioListTile(
                contentPadding: const EdgeInsets.all(0),
                activeColor: primaryColor,
                controlAffinity: ListTileControlAffinity.trailing,
                value: 1,
                title: const Text(
                  'English (US)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
              RadioListTile(
                contentPadding: const EdgeInsets.all(0),
                activeColor: primaryColor,
                controlAffinity: ListTileControlAffinity.trailing,
                value: 2,
                title: const Text(
                  'English (UK)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 0.8,
                width: Get.width,
                color: lightborderColor,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Language',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 550,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: languageController.languagelist.length,
                    itemBuilder: (context, index) => ListTile(
                          onTap: () {
                            setState(() {
                              languageController.selectedindex.value = index;
                            });
                          },
                          contentPadding: const EdgeInsets.all(0),
                          leading: Text(
                            languageController.languagelist[index],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 12,
                                width: 12,
                                decoration: BoxDecoration(
                                  color:
                                      languageController.selectedindex.value ==
                                              index
                                          ? primaryColor
                                          : whitecolor,
                                  border: Border.all(
                                      color: languageController
                                                  .selectedindex.value ==
                                              index
                                          ? primaryColor
                                          : whitecolor,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: primaryColor, width: 2),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
