// import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Constants {
  static final oCcy = NumberFormat('#,##0.00', 'en_US');

  static const String egPhonePattern = r'(011|012|015|010)[0-9]{8}$';
  static const String emailPattern =
      r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)";
  static const String usernamePattern =
      r"[\u0621-\u064AA-Za-z0-9 \\.\\-_]{7,30}$";
  static const String passwordPatternSpecial =
      r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$";
  static const String passwordPatternNumeric =
      r"(?=^.{8,}$)(?=.*\\d)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$";
  static const String firstnamePattern = r"^[A-Za-z \\.\\-_]{2,20}$";
  static const String lastnamePattern = r"^[A-Za-z \\.\\-_]{7,40}$";
  static const String namePattern = r"^[\u0621-\u064AA-Za-z0-9 \.\-_]{7,30}$";
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

// //encrypt
//   static String encryptMyData({required String text}) {
//     final key =
//         encrypt.Key.fromUtf8(''); //32 chars
//     final iv = encrypt.IV.fromUtf8(''); //16 chars

//     final e = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
//     final encryptedData = e.encrypt(text, iv: iv);
//     return encryptedData.base64;
//   }
}
