import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/utils/images.dart';

class HomePageController extends GetxController {
  var selectedindex = 1.obs;
  TextEditingController commentcontroller = TextEditingController();

  List sendtolist = [whatsapp, message, instagram, sms, messenger];
  List sendtonamelist = [
    "Whatsapp",
    "Message",
    "Instagram",
    "SMS",
    "Messenger"
  ];
  List sendtoicon = [send1, send2, send3, send4, send5, send6, send7, send8];
  List sendtoiconstring = [
    "Report",
    "Not inter..",
    "Save video",
    "Set as W...",
    "Dute",
    "Stitch",
    "Add to Fa..",
    "React"
  ];
}
