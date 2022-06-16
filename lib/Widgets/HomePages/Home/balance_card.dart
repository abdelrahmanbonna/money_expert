import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceCard extends StatelessWidget {
  final double cashBalance, bankBalance;
  final double? width, height;
  const BalanceCard({
    Key? key,
    required this.bankBalance,
    required this.cashBalance,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Container(
      width: width ?? mediaQuery.size.width,
      height: height ?? mediaQuery.size.height * 0.15,
      margin: EdgeInsets.symmetric(
        horizontal: mediaQuery.size.width * 0.0427,
        vertical: mediaQuery.size.height * 0.01,
      ),
      padding: const EdgeInsets.all(16),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'home_screen.cash_balance'.tr(),
                style: GoogleFonts.ubuntu(
                  textStyle: theme.textTheme.headline4,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  color: theme.primaryColor.withOpacity(0.7),
                ),
              ),
              Text(
                cashBalance.toString(),
                style: GoogleFonts.ubuntu(
                  textStyle: theme.textTheme.headline4,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: theme.primaryColor.withOpacity(0.7),
                ),
              ),
            ],
          ),
          Container(
            height: mediaQuery.size.height * 0.15,
            width: 3,
            margin: EdgeInsets.symmetric(
              horizontal: mediaQuery.size.width * 0.05,
            ),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'home_screen.bank_balance'.tr(),
                style: GoogleFonts.ubuntu(
                  textStyle: theme.textTheme.headline4,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  color: theme.primaryColor.withOpacity(0.7),
                ),
              ),
              Text(
                bankBalance.toString(),
                style: GoogleFonts.ubuntu(
                  textStyle: theme.textTheme.headline4,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: theme.primaryColor.withOpacity(0.7),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
