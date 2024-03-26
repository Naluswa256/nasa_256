import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/screens/profile/controller/notificationcontroller.dart';
import 'package:tiktok/utils/color.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationController notificationController =
      Get.put(NotificationController());
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
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  color: greyColor,
                  size: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Interactions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              notificationWidget(),
              Container(
                height: 0.8,
                width: Get.width,
                color: lightborderColor,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'TokTik Now',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text(
                  "Daily notifications",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Obx(
                  () => Switch(
                    value: notificationController.dailymessage.value,
                    onChanged: (val) {
                      notificationController.dailymessage.value = val;
                    },
                    activeColor: whitecolor,
                    inactiveTrackColor: lightborderColor,
                    inactiveThumbColor: whitecolor,
                    activeTrackColor: primaryColor,
                  ),
                ),
              ),
              const Text(
                'You’ll receive a notification to post your Now\ntogether with your friends every day at a random\ntime',
                style: TextStyle(
                  color: Color(0xFF86878B),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
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
                'Messages',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text(
                  "Direct messages",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Obx(
                  () => Switch(
                    value: notificationController.directmessage.value,
                    onChanged: (val) {
                      notificationController.directmessage.value = val;
                    },
                    activeColor: whitecolor,
                    inactiveTrackColor: lightborderColor,
                    inactiveThumbColor: whitecolor,
                    activeTrackColor: primaryColor,
                  ),
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text(
                  "Direct messages preview",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Obx(
                  () => Switch(
                    value: notificationController.directmessagepreview.value,
                    onChanged: (val) {
                      notificationController.directmessagepreview.value = val;
                    },
                    activeColor: whitecolor,
                    inactiveTrackColor: lightborderColor,
                    inactiveThumbColor: whitecolor,
                    activeTrackColor: primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget notificationWidget() {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: notificationController.interactionlist.length,
        itemBuilder: (context, index) => ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            notificationController.interactionlist[index],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Obx(
            () => Switch(
              value: notificationController.interactiontoggle[index].value,
              onChanged: (val) {
                notificationController.interactiontoggle[index].value = val;
              },
              activeColor: whitecolor,
              activeTrackColor: primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
