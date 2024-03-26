import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tiktok/utils/color.dart';

import '../controller/reportcontroller.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  ReportController reportController = Get.put(ReportController());
  String selectedValue = 'Dangerous organizations/individuals';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        backgroundColor: whitecolor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Report',
          style: TextStyle(
            color: blackcolor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SizedBox(
        height: Get.height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Select a reason',
                        style: TextStyle(
                          color: blackcolor,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: reportController.options.length,
                        itemBuilder: (context, index) => RadioListTile(
                          activeColor: primaryColor,
                          title: Text(reportController.options[index]),
                          value: reportController.options[index],
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 150,
                      )
                    ]),
              ),
            ),
            Container(
              height: 150,
              color: whitecolor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: Get.width * .40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: lightpinkColor),
                    child: const Center(
                      child: Text(
                        'Cancel',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: Get.width * .40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: primaryColor),
                    child: const Center(
                      child: Text(
                        'Submit',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: whitecolor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
