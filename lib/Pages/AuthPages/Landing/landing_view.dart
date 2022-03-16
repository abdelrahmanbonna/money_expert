import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_expert/Configurations/configurations.dart';
import 'package:money_expert/Pages/AuthPages/Landing/landing_viewmodel.dart';
import 'package:money_expert/extensions/extensions.dart';
import 'package:pmvvm/pmvvm.dart';
import '../../../Widgets/General/raised_rounded_button.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: () => const LandingView(),
      viewModel: LandingViewModel(),
    );
  }
}

class LandingView extends HookView<LandingViewModel> {
  final String titleTag = 'title';

  const LandingView({Key? key}) : super(key: key);

  @override
  Widget render(BuildContext context, LandingViewModel viewModel) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: titleTag,
            child: Text(
              'app_title'.tr(),
              style: GoogleFonts.ubuntu(
                textStyle: theme.textTheme.headline4,
                fontSize: 48,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: theme.primaryColor,
              ),
            ).setOnlyPadding(context, 0, 0.1, 0, 0),
          ),
          RaisedRoundedButton(
            title: 'landing_screen.login'.tr(),
            onTap: () => Navigator.of(context)
                .pushNamed(PageRouteName.login, arguments: [
              titleTag,
            ]),
          ).setHorizontalAndVerticalPadding(context, 0.0427, 0.02),
          RaisedRoundedButton(
            title: 'landing_screen.sign_up'.tr(),
            onTap: () => Navigator.of(context)
                .pushNamed(PageRouteName.signUp, arguments: [
              titleTag,
            ]),
          ).setHorizontalAndVerticalPadding(context, 0.0427, 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DayNightSwitcher(
                isDarkModeEnabled: viewModel.isDarkModeEnabled,
                onStateChanged: (isDarkModeEnabled) {
                  viewModel.setDarkMode(isDarkModeEnabled);
                },
              ).setOnlyPadding(context, 0, 0, 0.1, 0),
              DropdownButton<String>(
                borderRadius: BorderRadius.circular(10),
                dropdownColor: theme.scaffoldBackgroundColor,
                items: const [
                  DropdownMenuItem(
                    child: Text('English'),
                    value: 'en',
                  ),
                  DropdownMenuItem(
                    child: Text('العربية'),
                    value: 'ar',
                  ),
                ],
                value: context.locale.toString(),
                onChanged: (lng) {
                  context.setLocale(Locale(lng ?? 'en'));
                },
              )
            ],
          ).setOnlyPadding(context, 0.03, 0.02, 0.0427, 0.0427),
          Text(
            'all_rights_reserved'.tr(),
            style: GoogleFonts.ubuntu(
              textStyle: theme.textTheme.headline4,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              color: theme.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
