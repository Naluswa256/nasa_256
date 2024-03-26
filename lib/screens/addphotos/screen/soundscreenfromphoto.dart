import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/images.dart';
import '../controller/soundcontroller2.dart';

class SoundScreenFromPhoto extends StatefulWidget {
  const SoundScreenFromPhoto({super.key});

  @override
  State<SoundScreenFromPhoto> createState() => _SoundScreenFromPhotoState();
}

class _SoundScreenFromPhotoState extends State<SoundScreenFromPhoto> {
  SoundController2 soundController2 = Get.put(SoundController2());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Sounds ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: blackcolor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Container(
                width: Get.width * .90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: greyEB),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    hintText: "Search",
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BottomAppBar(
                surfaceTintColor: whitecolor,
                height: 50,
                padding: EdgeInsets.zero,
                color: whitecolor,
                child: Center(
                  child: TabBar(
                    tabAlignment: TabAlignment.center,
                    isScrollable: false,
                    controller: soundController2.controller1,
                    dividerColor: lightborderColor,
                    indicatorColor: primaryColor,
                    tabs: soundController2.myTabs,
                    labelColor: primaryColor,
                    labelStyle: const TextStyle(
                      color: Color(0xFF797979),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                height: Get.height * .72,
                color: whitecolor,
                child: TabBarView(
                  controller: soundController2.controller1,
                  children: [discoverWidget(), favouriteWidget()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget discoverWidget() {
    return SizedBox(
      height: Get.height * .70,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: soundController2.musicimages.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => soundWidget(index),
      ),
    );
  }

  Widget soundWidget(index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: Image.asset(soundController2.musicimages[index]),
        title: Text(
          soundController2.musicname[index],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Brooklyn Grande',
              style: TextStyle(
                color: Color(0xFF86878B),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '01:00',
              style: TextStyle(
                color: Color(0xFF86878B),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        trailing: GestureDetector(
            onTap: () {
              if (soundController2.selecteditem.contains(index)) {
                setState(() {
                  soundController2.selecteditem.remove(index);
                });
              } else {
                setState(() {
                  soundController2.selecteditem.add(index);
                });
              }
            },
            child: soundController2.selecteditem.contains(index)
                ? SvgPicture.asset(
                    save2,
                    color: primaryColor,
                  )
                : SvgPicture.asset(
                    save1,
                  )),
      ),
    );
  }

  Widget favouriteWidget() {
    return SizedBox(
        height: Get.height * .70,
        child: soundController2.musicimages.isNotEmpty
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: soundController2.musicimages.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => soundWidget2(index),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    SvgPicture.asset(
                      save1,
                      height: 100,
                      width: 80,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Favorite sounds',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      'Add sounds to Favorites so you can easily use\nof find them later.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF86878B),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]));
  }

  Widget soundWidget2(index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: Image.asset(soundController2.musicimages[index]),
        title: Text(
          soundController2.musicname[index],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Brooklyn Grande',
              style: TextStyle(
                color: Color(0xFF86878B),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '01:00',
              style: TextStyle(
                color: Color(0xFF86878B),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        trailing: GestureDetector(
            onTap: () {
              if (soundController2.selecteditem.contains(index)) {
                setState(() {
                  soundController2.selecteditem.remove(index);
                });
              } else {
                setState(() {
                  soundController2.selecteditem.add(index);
                });
              }
            },
            child: soundController2.selecteditem.contains(index)
                ? SvgPicture.asset(
                    save1,
                    color: primaryColor,
                  )
                : SvgPicture.asset(
                    save2,
                  )),
      ),
    );
  }
}
