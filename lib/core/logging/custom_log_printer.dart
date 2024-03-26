import 'package:logger/logger.dart';

class CustomLogPrinter extends LogPrinter {
  final String className;
  CustomLogPrinter({required this.className});

  final logger = Logger();

  @override
  List<String> log(LogEvent event) {
    
    return ['$className - ${event.message}'];
  }
}
