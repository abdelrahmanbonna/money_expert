import 'package:easy_localization/easy_localization.dart' as i;
import 'package:flutter/cupertino.dart';

import '../Configurations/configurations.dart';

extension FormatNumber on String {
  String formatPhoneNum(BuildContext context) {
    String value;
    if (RegExp(Constants.egPhonePattern).hasMatch(this)) {
      String otherData = '';
      value = substring(indexOf('0'), indexOf("0") + 11);
      otherData = replaceAll(value, '');
      String first = value.substring(0, 4);
      String second = value.substring(4, 8);
      String third = value.substring(8, 11);
      if (context.locale.toString() == 'en') {
        value = "$first $second $third";
      } else {
        value = "$third $second $first";
      }
      return otherData + value;
    } else {
      return this;
    }
  }
}
