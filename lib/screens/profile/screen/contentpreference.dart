import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';

class ContentPreferenceScreen extends StatefulWidget {
  const ContentPreferenceScreen({super.key});

  @override
  State<ContentPreferenceScreen> createState() =>
      _ContentPreferenceScreenState();
}

class _ContentPreferenceScreenState extends State<ContentPreferenceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'Content preferences',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text(
                  "Filter video keywords",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: SizedBox(
                  width: Get.width * .40,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "0",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF86878B),
                          fontSize: 16,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w400,
                          height: 0.08,
                          letterSpacing: -0.16,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: greyColor,
                      ),
                    ],
                  ),
                )),
            ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text(
                  "Restricted Mode",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: SizedBox(
                  width: Get.width * .40,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Off",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF86878B),
                          fontSize: 16,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w400,
                          height: 0.08,
                          letterSpacing: -0.16,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: greyColor,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
