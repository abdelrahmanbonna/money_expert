import 'package:flutter/material.dart';
import 'package:money_expert/Models/User/user_model.dart';
import 'package:pmvvm/view_model.dart';
import 'package:theme_manager/theme_manager.dart';

class HomeViewModel extends ViewModel {
  final GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
  bool _raiseNav = false, _userDataloaded = true;
  bool _isDarkModeEnabled = false;

  final User _usr = User(
    userName: 'Abdelrahman Bonna',
    imageURL: 'https://picsum.photos/200',
    bankBalance: 50000.00,
    cashBalance: 2000.00,
  );

  bool get raiseNav => _raiseNav;
  bool get userDataloaded => _userDataloaded;
  bool get isDarkModeEnabled => _isDarkModeEnabled;
  String get username => _usr.userName;
  String get imgURL => _usr.imageURL;
  double get cashBalance => _usr.cashBalance;
  double get bankBalance => _usr.bankBalance;

  void setRaiseNav(bool swtch) {
    _raiseNav = swtch;
    notifyListeners();
  }

  void setUserDataLoaded(bool v) {
    _userDataloaded = v;
    notifyListeners();
  }

  void setDarkMode(bool v) {
    _isDarkModeEnabled = v;
    ThemeManager.of(context)
        .setBrightnessPreference(
            v ? BrightnessPreference.dark : BrightnessPreference.light)
        .then((value) => notifyListeners());
  }

  @override
  void init() {
    if (ThemeManager.of(context).brightnessPreference ==
        BrightnessPreference.dark) _isDarkModeEnabled = true;
    super.init();
  }

  
}
