import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/screens/addphotos/controller/photocontroller.dart';
import 'package:tiktok/utils/color.dart';

import 'package:tiktok/utils/images.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  PhotoController photoController = Get.put(PhotoController());

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
          'Post',
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
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 127,
                            width: Get.width * .65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: greyEB),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Describe your post, add hashtags,\nor mention creators that inspired\nyou',
                                style: TextStyle(
                                  color: Color(0xFF86878B),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image.asset(
                                pic1,
                                height: 127,
                              ),
                              const Text(
                                'Select cover',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      iconButtonWidget(),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 1.2,
                        width: Get.width,
                        color: lightborderColor,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      featureWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Automatically share to:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      socialwidget(),
                     const  SizedBox(height: 150,)
                    
                    ]),
              ),
            ),
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: whitecolor,
              border: Border.all(color: greyEB),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: Get.width * .40,
                    height: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: lightpinkColor,
                    ),
                    child: const Center(
                      child: Text(
                        "Drafts",
                        style: TextStyle(
                            fontSize: 22,
                            color: primaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          buttonWidget()
        ],
      ),
    );
  }

  Widget iconButtonWidget() {
    return Row(
      children: [
        Container(
          width: 100,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: primaryColor),),
          child: const Center(
            child: Text(
              '# Hashtag',
              style: TextStyle(
                color: primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          width: 100,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: primaryColor)),
          child: const Center(
            child: Text(
              '@ Mention',
              style: TextStyle(
                color: primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          width: 100,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: primaryColor)),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.video_call_rounded,
                  color: primaryColor,
                  size: 16,
                ),
                Text(
                  ' Videos',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget featureWidget() {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: SvgPicture.asset(post1),
          title: const Text(
            'Tag People',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: greyColor,
                size: 20,
              )),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: const Icon(
            Icons.location_on_outlined,
            color: primaryColor,
          ),
          title: const Text(
            'Locations',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: greyColor,
                size: 20,
              )),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: SvgPicture.asset(post3),
          title: const Text(
            'Add link',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                size: 24,
                color: primaryColor,
              )),
        ),
        ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: SvgPicture.asset(post4),
            title: const Text(
              'Who can watch this video',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: SizedBox(
              width: Get.width * .27,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Everyone',
                    style: TextStyle(
                      color: Color(0xFF86878B),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: greyColor,
                    size: 20,
                  )
                ],
              ),
            )),
        ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: SvgPicture.asset(post5),
            title: const Text(
              'Allow comments',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Obx(
              () => Switch(
                value: photoController.comment.value,
                onChanged: (val) {
                  photoController.comment.value = val;
                },
                activeColor: whitecolor,
                activeTrackColor: primaryColor,
              ),
            )),
      ],
    );
  }

  Widget socialwidget() {
    return Row(
      children: [
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80), color: lightpinkColor),
          child: Center(child: SvgPicture.asset(post6)),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80), color: lightpinkColor),
          child: Center(child: SvgPicture.asset(post7)),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80), color: lightpinkColor),
          child: Center(child: SvgPicture.asset(post8)),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80), color: lightpinkColor),
          child: Center(child: SvgPicture.asset(post9)),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget buttonWidget() {
    return Container(
      height: 100,
      width: Get.width,
      decoration: BoxDecoration(
        color: whitecolor,
        border: Border.all(color: greyEB),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: Get.width * .42,
              height: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: lightpinkColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(post10),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Drafts",
                    style: TextStyle(
                        fontSize: 22,
                        color: primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: Get.width * .42,
              height: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(post11),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "post",
                    style: TextStyle(
                        fontSize: 22,
                        color: whitecolor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
