import 'package:get/get.dart';

class ReportController extends GetxController {
  List<String> options = [
    'Dangerous organizations/individuals',
    'Frauds & Scams',
    'Misleading Information',
    'Illegal activities or regulated goods',
    'Violent & graphic contents',
    'Animal Cruelty',
    'Pornograpy & nudity',
    'Hate Speech',
    'Harrashment or bullying',
    'Intelectual property infringement',
    'Spam',
    'Minor Safety',
    'Other'
  ];
  RxInt? selectedValue = 0.obs;
}
