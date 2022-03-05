import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:money_expert/Pages/Splash/splash_viewmodel.dart';
import 'package:pmvvm/pmvvm.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => const SplashView(),
      viewModel: SplashViewModel(),
    );
  }
}

class SplashView extends HookView<SplashViewModel> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget render(BuildContext context, SplashViewModel viewModel) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height,
            decoration: const BoxDecoration(
              color: Colors.lightGreen,
            ),
            child: Text(
              'app_title'.tr(),
              // style: GoogleFonts.lato(
              //   textStyle: Theme.of(context).textTheme.headline4,
              //   fontSize: 48,
              //   fontWeight: FontWeight.w700,
              //   fontStyle: FontStyle.italic,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
