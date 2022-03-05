import 'package:pmvvm/pmvvm.dart';
import 'package:theme_manager/theme_manager.dart';

class LandingViewModel extends ViewModel {
  bool _isDarkModeEnabled = false;
  bool get isDarkModeEnabled => _isDarkModeEnabled;

  void setDarkMode(bool v) {
    _isDarkModeEnabled = v;
    ThemeManager.of(context)
        .setBrightnessPreference(
            v ? BrightnessPreference.dark : BrightnessPreference.light)
        .then((value) => notifyListeners());
  }
}
