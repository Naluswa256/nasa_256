import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/screens/profile/controller/privacycontroller.dart';
import '../../../utils/color.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  PrivacyController privacyController = Get.put(PrivacyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        backgroundColor: whitecolor,
        surfaceTintColor: whitecolor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Privacy',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Discoverability',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text(
                  'Private Account',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Obx(
                  () => Switch(
                    value: privacyController.privacyswitch.value,
                    onChanged: (val) {
                      privacyController.privacyswitch.value = val;
                    },
                    activeColor: whitecolor,
                    activeTrackColor: primaryColor,
                  ),
                )),
            const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Suggest Account to Others',
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
                  'Sync Contacts & Friends',
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
            Container(
              height: 0.8,
              width: Get.width,
              color: lightborderColor,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Interactions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            interactionWidget()
          ]),
        ),
      ),
    );
  }

  Widget interactionWidget() {
    return SizedBox(
      height: 700,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: privacyController.interactionlist.length,
        itemBuilder: (context, index) => ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              privacyController.interactionlist[index]['title'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: SizedBox(
              width: Get.width * .40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    privacyController.interactionlist[index]['sub'],
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Color(0xFF86878B),
                      fontSize: 16,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w400,
                      height: 0.08,
                      letterSpacing: -0.16,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                    color: greyColor,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
