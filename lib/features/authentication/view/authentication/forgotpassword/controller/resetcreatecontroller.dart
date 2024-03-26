import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetCreatePasswordController extends GetxController {
  var passwordlength = false.obs;
  var spedcialcharacter = false.obs;
  var letternumber = false.obs;
  TextEditingController passwordcontroller = TextEditingController();

  RegExp spcharacterReg = RegExp(r'[!@#$%^&*()_+]');
  RegExp numberandchar = RegExp(r'[a-zA-Z0-9]');
}
