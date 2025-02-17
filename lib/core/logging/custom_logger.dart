import 'package:logger/logger.dart';
import '../logging/custom_log_output.dart';
import '../logging/custom_log_printer.dart';
class CustomLogger extends Logger {
  final String className;

  CustomLogger({required this.className})
      : super(
          output: CustomLogOutput(),
          printer: CustomLogPrinter(className: className),
        );
}
