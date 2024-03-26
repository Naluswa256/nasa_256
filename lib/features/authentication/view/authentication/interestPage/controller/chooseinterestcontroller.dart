import 'dart:developer';

import 'package:get/get.dart';

import '../../../../../../utils/images.dart';

class ChooseInterestController extends GetxController {

  
  RxList<InterestsInfo> selectedList = <InterestsInfo>[].obs;
  List<InterestsInfo> itemList = [
    InterestsInfo(title: "Photography", image: camera),
    InterestsInfo(title: "Shopping", image: bag),
    InterestsInfo(title: "Karaoke", image: microPhone),
    InterestsInfo(title: "Yoga", image: yoga),
    InterestsInfo(title: "Cooking", image: cooking),
    InterestsInfo(title: "Tennis", image: tennis),
    InterestsInfo(title: "Run", image: run),
    InterestsInfo(title: "Swimming", image: swimming),
    InterestsInfo(title: "Art", image: art),
    InterestsInfo(title: "Traveling", image: traveling),
    InterestsInfo(title: "Extreme", image: extreme),
    InterestsInfo(title: "Music", image: music),
    InterestsInfo(title: "Drink", image: drink),
    InterestsInfo(title: "Video games", image: videoGame),
  ];
}

class InterestsInfo {
  String? title;
  String? image;

  InterestsInfo({this.title, this.image});
}
