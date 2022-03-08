import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../extensions/padding_ext.dart';

class WelcomeCard extends StatelessWidget {
  final String username;
  const WelcomeCard({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Container(
      width: mediaQuery.size.width,
      height: mediaQuery.size.height * 0.1,
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
        children: [
          SizedBox(
            width: mediaQuery.size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'home_screen.welcome'.tr(),
                  style: GoogleFonts.lato(
                    textStyle: theme.textTheme.headline4,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: theme.primaryColor.withOpacity(0.7),
                  ),
                ),
                Text(
                  username,
                  style: GoogleFonts.lato(
                    textStyle: theme.textTheme.headline4,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: theme.primaryColor.withOpacity(0.7),
                  ),
                ).setOnlyPadding(context, 0.002, 0, 0, 0.03),
              ],
            ),
          ),
          Container(
            width: mediaQuery.size.width * 0.13,
            height: mediaQuery.size.width * 0.13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://picsum.photos/200',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
