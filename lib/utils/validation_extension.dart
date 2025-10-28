import 'dart:io';
import 'package:intl/intl.dart';

import 'import_files.dart';

extension StringValueExtension on String {
  ///  //Email validation
  static bool emailValidation(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  bool get isValidUrl {
    final Uri? uri = Uri.tryParse(this);
    return uri != null && (uri.hasScheme && uri.hasAuthority);
  }

  String get toTitleCase {
    if (isEmpty) return this;

    return split(' ')
        .map((word) =>
    word.isEmpty ? word : word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  String get formatDuration {
    double seconds;

    if (this is num) {
      seconds = (this as num).toDouble();
    } else {
      seconds = double.tryParse(this) ?? 0;
    }


    if (seconds < 60) {
      return '${seconds.toStringAsFixed(0)} sec';
    } else if (seconds < 3600) {
      final minutes = (seconds / 60).floor();
      return '$minutes min';
    } else {
      final hours = (seconds / 3600).floor();
      final minutes = ((seconds % 3600) / 60).floor();
      return minutes == 0 ? '$hours hr' : '$hours hr $minutes min';
    }
  }
}

extension DateFormatToTime on DateTime {
  String get formatDateTimeForApi {
    DateFormat formatter = DateFormat("dd/MM/yyyy");
    return formatter.format(this);
  }

}

extension SizeExtension on num {
  double get w => Get.width * (this / 100);

  double get h => Get.height * (this / 100);

  double get sp => (this * Get.textScaleFactor);
}
