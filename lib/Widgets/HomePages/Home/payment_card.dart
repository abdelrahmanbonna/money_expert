import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_expert/Configurations/responsive.dart';

import '../../../extensions/padding_ext.dart';

class PaymentCard extends StatelessWidget {
  final String thing;
  final double amount;
  const PaymentCard({
    Key? key,
    required this.thing,
    this.amount = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return SizedBox(
      width: mediaQuery.size.width,
      height: Responsive.isMobile(context) ? mediaQuery.size.height * 0.1 : 300,
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
              FontAwesomeIcons.moneyBill,
              color: const Color(0xffe84118).withOpacity(0.9),
              size: 30,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                thing,
                style: GoogleFonts.ubuntu(
                  textStyle: theme.textTheme.headline4,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  color: const Color(0xffe84118).withOpacity(0.9),
                ),
              ).setOnlyPadding(context, 0, 0.01, 0, 0),
              Text(
                amount.toString(),
                style: GoogleFonts.ubuntu(
                  textStyle: theme.textTheme.headline4,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xffe84118).withOpacity(0.9),
                ),
              ),
            ],
          ).setOnlyPadding(context, 0, 0, 0.0427, 0.0427)
        ],
      ),
    );
  }
}
