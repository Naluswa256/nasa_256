import 'package:get/get.dart';
import 'package:tiktok/utils/images.dart';

class LiveController extends GetxController {
  List<String> commentlist = [
    "Woohoooo",
    "How are you?",
    "I’d like if we could elaborate more on this.",
    "Wow, this is really epic",
    "The info here is really solid. Let’s explorethis more",
    "Haha that’s terrifying"
  ];
  var selectedindex = 0.obs;
  List<int> followlist = [];
  List viewer = [
    viewer1,
    viewer2,
    viewer3,
    viewer4,
    viewer5,
    viewer1,
    viewer2,
    viewer3,
    viewer4,
    viewer5
  ];
  List<String> viewernamelist = [
    "Leslie Alexander",
    "Esther Howard",
    "Jane Cooper",
    "Jenny Wilson",
    "Esther Howard",
    "Leslie Alexander",
    "Esther Howard",
    "Jane Cooper",
    "Jenny Wilson",
    "Esther Howard",
  ];
}
