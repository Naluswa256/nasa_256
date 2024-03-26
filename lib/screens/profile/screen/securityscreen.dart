import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/screens/profile/controller/settingcontroller.dart';

import '../../../utils/color.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  SettingController settingController = Get.put(SettingController());
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
          'Security',
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
            const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Security alerts',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: greyColor,
                )),
            const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Manage devices',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: greyColor,
                )),
            const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Manage app permissions',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: greyColor,
                )),
            ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text(
                  "2-step verification",
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
            const Text(
              '2-setp verification offers an extra layer of security\nfor your account, even if someone knows your\npassword.',
              style: TextStyle(
                color: Color(0xFF86878B),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text(
                'Save login info',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Obx(
                () => Switch(
                  value: settingController.securityswitch.value,
                  onChanged: (val) {
                    settingController.securityswitch.value = val;
                  },
                  activeColor: whitecolor,
                  activeTrackColor: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
