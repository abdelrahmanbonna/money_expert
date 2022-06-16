import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_expert/Pages/HomePages/Home/home_viewmodel.dart';
import 'package:money_expert/extensions/extensions.dart';

/// Home Drawer which appears in Home
class HomeDrawer extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomeDrawer({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                style: ListTileStyle.drawer,
                leading: Icon(
                  FontAwesomeIcons.person,
                  color: theme.primaryColor,
                ),
                title: Text(
                  'home_drawer.profile'.tr(),
                  style: GoogleFonts.ubuntu(
                    textStyle: theme.textTheme.headline4,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: theme.primaryColor.withOpacity(0.7),
                  ),
                ),
              ),
              ListTile(
                style: ListTileStyle.drawer,
                leading: Icon(
                  FontAwesomeIcons.peopleGroup,
                  color: theme.primaryColor,
                ),
                title: Text(
                  'home_drawer.friends'.tr(),
                  style: GoogleFonts.ubuntu(
                    textStyle: theme.textTheme.headline4,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: theme.primaryColor.withOpacity(0.7),
                  ),
                ),
              ),
              ListTile(
                style: ListTileStyle.drawer,
                leading: Icon(
                  FontAwesomeIcons.moneyBill,
                  color: theme.primaryColor,
                ),
                title: Text(
                  'home_drawer.personal_money_management'.tr(),
                  style: GoogleFonts.ubuntu(
                    textStyle: theme.textTheme.headline4,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: theme.primaryColor.withOpacity(0.7),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DayNightSwitcher(
                    isDarkModeEnabled: viewModel.isDarkModeEnabled,
                    onStateChanged: (isDarkModeEnabled) {
                      viewModel.setDarkMode(isDarkModeEnabled);
                    },
                  ),
                  DropdownButton<String>(
                    borderRadius: BorderRadius.circular(10),
                    dropdownColor: theme.scaffoldBackgroundColor,
                    items: const [
                      DropdownMenuItem(
                        value: 'en',
                        child: Text('English'),
                      ),
                      DropdownMenuItem(
                        value: 'ar',
                        child: Text('العربية'),
                      ),
                    ],
                    value: context.locale.toString(),
                    onChanged: (lng) {
                      context.setLocale(Locale(lng ?? 'en'));
                    },
                  )
                ],
              ).setOnlyPadding(context, 0.03, 0.02, 0, 0),
            ],
          ),
        ),
      ),
    );
  }
}
