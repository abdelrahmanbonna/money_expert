import 'package:pmvvm/view_model.dart';

class HomeViewModel extends ViewModel {
  bool _raiseNav = false, _userDataloaded = true;
  String _username = 'Abdelrahman Bonna';
  double _balance = 5000;

  bool get raiseNav => _raiseNav;
  bool get userDataloaded => _userDataloaded;
  String get username => _username;
  double get balance => _balance;

  void setRaiseNav(bool swtch) {
    _raiseNav = swtch;
    notifyListeners();
  }

  void setUserDataLoaded(bool v) {
    _userDataloaded = v;
    notifyListeners();
  }
}
