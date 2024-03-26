import 'package:get/get.dart';

class PrivacyController extends GetxController {
  var privacyswitch = true.obs;
  List<Map<String, dynamic>> interactionlist = [
    {"title": "Comments", "sub": ""},
    {"title": "Mentions and tags", "sub": ""},
    {"title": "Direct messages", "sub": ""},
    {"title": "Story", "sub": "Everyone"},
    {"title": "Duet", "sub": "Everyone"},
    {"title": "Stitch", "sub": "Everyone"},
    {"title": "Downloads", "sub": "On"},
    {"title": "Following List", "sub": "Everyone"},
    {"title": "Liked Videos", "sub": "Only me"},
    {"title": "Post Views", "sub": "On"},
    {"title": "Profile Views", "sub": "On"},
    {"title": "Blocked Accounts", "sub": ""},
  ];
}
