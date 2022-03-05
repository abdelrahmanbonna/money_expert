import 'package:flutter/material.dart';
import 'package:money_expert/Configurations/configurations.dart';
import 'package:pmvvm/pmvvm.dart';

class SplashViewModel extends ViewModel {
  @override
  void init() {
    super.init();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
    ).then((value) {
      Navigator.of(context).pushReplacementNamed(
        PageRouteName.landing,
      );
    });
  }
}
