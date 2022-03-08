import 'package:pmvvm/pmvvm.dart';
import 'package:theme_manager/theme_manager.dart';

class LandingViewModel extends ViewModel {
  bool _isDarkModeEnabled = false;
  bool get isDarkModeEnabled => _isDarkModeEnabled;

  @override
  void init() {
    if (ThemeManager.of(context).brightnessPreference ==
        BrightnessPreference.dark) _isDarkModeEnabled = true;
    super.init();
  }

  void setDarkMode(bool v) {
    _isDarkModeEnabled = v;
    ThemeManager.of(context)
        .setBrightnessPreference(
            v ? BrightnessPreference.dark : BrightnessPreference.light)
        .then((value) => notifyListeners());
  }
}
