import 'package:flutter/material.dart';

class Responsive {
  // Device screens
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTab(BuildContext context) =>
      MediaQuery.of(context).size.width < 1360 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktopSmall(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1360 &&
      MediaQuery.of(context).size.width < 1550;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1550;

// Orentation
  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).size.height < 600;

  static bool isPortriat(BuildContext context) =>
      MediaQuery.of(context).size.height > 600;
}