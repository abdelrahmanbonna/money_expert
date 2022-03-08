import 'package:pmvvm/view_model.dart';

class HomeViewModel extends ViewModel {
  bool _raiseNav = false;

  bool get raiseNav => _raiseNav;

  void setRaiseNav(bool swtch) {
    _raiseNav = swtch;
    notifyListeners();
  }
}
