import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletons/skeletons.dart';

import '../../../extensions/padding_ext.dart';

class WelcomeCard extends StatelessWidget {
  final String username;
  final bool loaded;
  const WelcomeCard({
    Key? key,
    required this.username,
    this.loaded = true,
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
                if (loaded)
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
                if (!loaded)
                  SkeletonLine(
                    style: SkeletonLineStyle(
                      width: mediaQuery.size.width * 0.3,
                      height: 20,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                if (loaded)
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
                if (!loaded)
                  SkeletonLine(
                    style: SkeletonLineStyle(
                      width: mediaQuery.size.width * 0.6,
                      height: 30,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ).setOnlyPadding(context, 0.007, 0, 0, 0.03),
              ],
            ),
          ),
          Container(
            width: mediaQuery.size.width * 0.13,
            height: mediaQuery.size.width * 0.13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: loaded
                  ? const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://picsum.photos/200',
                      ),
                    )
                  : null,
            ),
            child: !loaded
                ? SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
