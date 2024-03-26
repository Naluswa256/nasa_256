import 'package:get/get.dart';
import 'package:tiktok/utils/images.dart';

class SettingController extends GetxController {
  var selectedindex = 0.obs;
  var securityswitch = false.obs;
  List<Map<String, dynamic>> accountlist = [
    {"icon": sett1, 'name': "Account"},
    {"icon": sett2, 'name': "Privacy"},
    {"icon": sett3, 'name': "Security"},
    {"icon": sett4, 'name': "Balance"},
    {"icon": sett5, 'name': "Share profile"},
  ];

  List<Map<String, dynamic>> switchaccount = [
    {'img': act1, "name": "John Doe", "id": "john_doe"},
    {'img': act2, "name": "Courtney Henry", "id": "courtney_henry"},
    {'img': act3, "name": "Ralph Edwards", "id": "Ralph_edwards"},
  ];

  List<Map<String, dynamic>> contentlist = [
    {"icon": sett6, 'name': "Push notifications"},
    {"icon": sett7, 'name': "LIVE"},
    {"icon": sett8, 'name': "Watch history"},
    {"icon": sett9, 'name': "Content preferences"},
    {"icon": sett10, 'name': "Ads"},
    {"icon": sett11, 'name': "Language"},
    {"icon": sett12, 'name': "Screen time"},
    {"icon": sett13, 'name': "Family Pairing"},
    {"icon": sett14, 'name': "Accessibility"},
  ];

  List<Map<String, dynamic>> sendlist = [
    {"icon": one, 'name': "Copy Link"},
    {"icon": two, 'name': "WhatsApp"},
    {"icon": three, 'name': "Facebook"},
    {"icon": four, 'name': "Messenger"},
    {"icon": five, 'name': "Twitter"},
    {"icon": six, 'name': "Instagram"},
    {"icon": seven, 'name': "Skype"},
    {"icon": eight, 'name': "Massage"},
  ];

  List<Map<String, dynamic>> cachelist = [
    {"icon": sett15, 'name': "Free up space"},
    {"icon": sett16, 'name': "Data Saver"},
    {"icon": sett17, 'name': "Wallpaper"},
  ];

  List<Map<String, dynamic>> supportlist = [
    {"icon": sett18, 'name': "Report a problem"},
    {"icon": sett19, 'name': "Support"},
    {"icon": sett20, 'name': "About"},
  ];

  List<Map<String, dynamic>> aboutlist = [
    {"icon": sett21, 'name': "Switch account"},
    {"icon": sett22, 'name': "Log out"},
  ];
}
