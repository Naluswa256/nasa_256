import 'package:get/get.dart';
import '../../../utils/images.dart';

class EditProfileController extends GetxController {
  List<Map<dynamic, dynamic>> icondata = [
    {"title": "Name", "sub": "John Doe"},
    {"title": "Username", "sub": "John Doe"},
    {"title": "Bio", "sub": "Add a bio"}
  ];

  List<Map<String, dynamic>> socialdata = [
    {"icon": post7, "title": "Instagram", "sub": "Add Instagram"},
    {"icon": post8, "title": "Facebook", "sub": "Add Facebook"},
    {"icon": post9, "title": "Instagram", "sub": "Add Twitter"}
  ];
}
