import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletons/skeletons.dart';

import '../../../extensions/padding_ext.dart';

class WelcomeCard extends StatelessWidget {
  final String username, imgURL;
  final bool loaded;
  const WelcomeCard({
    Key? key,
    required this.username,
    required this.imgURL,
    this.loaded = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Container(
      width: mediaQuery.size.width,
      height: mediaQuery.size.height * 0.13,
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
            width: mediaQuery.size.width * 0.68,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (loaded)
                  Text(
                    'home_screen.welcome'.tr(),
                    style: GoogleFonts.ubuntu(
                      textStyle: theme.textTheme.headline4,
                      fontSize: 14,
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
                    style: GoogleFonts.ubuntu(
                      textStyle: theme.textTheme.headline4,
                      fontSize: 24,
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
            margin: const EdgeInsets.only(
              left: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: loaded
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        imgURL,
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
