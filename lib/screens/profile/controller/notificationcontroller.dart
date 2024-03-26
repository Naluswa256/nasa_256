import 'package:get/get.dart';

class NotificationController extends GetxController {
  List<String> interactionlist = [
    "Like",
    "Comments",
    "New followers",
    "Mentions and tags",
    "Profile views",
    "Reposts"
  ];

  var directmessagepreview = false.obs;
  var directmessage = false.obs;
  var dailymessage = false.obs;
  List<RxBool> interactiontoggle = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
  ];
}
