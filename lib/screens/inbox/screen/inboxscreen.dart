import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/images.dart';

import 'messagescreen.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          width: Get.width / 3,
          child: const Row(children: [
            Text(
              'All Activity',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(Icons.keyboard_arrow_down)
          ]),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const MessageScreen());
            },
            icon: SvgPicture.asset(
              share,
              color: primaryColor,
              height: 24,
              width: 24,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Today',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            inboxwidget1(),
            inboxwidget2(),
            inboxwidget1(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Yesterday',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            inboxwidget2(),
            inboxwidget1(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'This Week',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            inboxwidget2(),
            inboxwidget1(),
            inboxwidget1(),
            const SizedBox(
              height: 100,
            )
          ]),
        ),
      ),
    );
  }

  Widget inboxwidget1() {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.asset(
            act1,
            fit: BoxFit.cover,
            height: 50,
            width: 50,
          )),
      title: const Text(
        'Jerome Bell',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: const Text(
        'Leave a comment on your video',
        style: TextStyle(
          color: Color(0xFF86878B),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Image.asset(music1),
    );
  }

  Widget inboxwidget2() {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.asset(
            act2,
            fit: BoxFit.cover,
            height: 50,
            width: 50,
          )),
      title: const Text(
        'Robert Fox',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: const Text(
        'Started following you',
        style: TextStyle(
          color: Color(0xFF86878B),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Container(
        width: 104,
        height: 30,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(20)),
        child: const Center(
          child: Text(
            'Follow Back',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
