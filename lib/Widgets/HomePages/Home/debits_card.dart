import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_expert/Configurations/responsive.dart';

import '../../../extensions/padding_ext.dart';

enum DebitType { owesYou, youOwe }

class DebitsCard extends StatelessWidget {
  final String username, thing;
  final IconData icon;
  final DebitType type;
  final double amount;
  const DebitsCard({
    Key? key,
    required this.icon,
    required this.username,
    required this.thing,
    this.type = DebitType.youOwe,
    this.amount = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return SizedBox(
      width: mediaQuery.size.width,
      height: mediaQuery.size.height * 0.12,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: Responsive.isMobile(context)
                ? mediaQuery.size.width * 0.15
                : 100,
            height: Responsive.isMobile(context)
                ? mediaQuery.size.width * 0.15
                : 100,
            margin: const EdgeInsets.only(
              right: 5,
            ),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500]!,
                  blurRadius: 15,
                  offset: const Offset(2.5, 2.5),
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: theme.shadowColor,
                  blurRadius: 15,
                  offset: const Offset(-2.5, -2.5),
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Icon(
              icon,
              color: type == DebitType.youOwe
                  ? const Color(0xffe84118).withOpacity(0.9)
                  : const Color(0xffe1b12c).withOpacity(0.9),
              size: 30,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Responsive.isMobile(context)
                    ? mediaQuery.size.width * 0.55
                    : 150,
                child: Text(
                  '${type == DebitType.youOwe ? '${'home_screen.you_owe'.tr()} $username' : '$username ${'home_screen.owes_you'.tr()}'} ${'home_screen.for'.tr()} $thing',
                  maxLines: 2,
                  style: GoogleFonts.ubuntu(
                    textStyle: theme.textTheme.headline4,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: type == DebitType.youOwe
                        ? const Color(0xffe84118).withOpacity(0.9)
                        : const Color(0xffe1b12c).withOpacity(0.9),
                  ),
                ).setOnlyPadding(context, 0, 0.01, 0, 0),
              ),
              Text(
                amount.toString(),
                style: GoogleFonts.ubuntu(
                  textStyle: theme.textTheme.headline4,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: type == DebitType.youOwe
                      ? const Color(0xffe84118).withOpacity(0.9)
                      : const Color(0xffe1b12c).withOpacity(0.9),
                ),
              ),
            ],
          ).setOnlyPadding(context, 0, 0, 0.0427, 0.0427)
        ],
      ),
    );
  }
}
