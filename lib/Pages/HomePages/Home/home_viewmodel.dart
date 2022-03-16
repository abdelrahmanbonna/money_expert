import 'package:money_expert/Models/User/user_model.dart';
import 'package:pmvvm/view_model.dart';

class HomeViewModel extends ViewModel {
  bool _raiseNav = false, _userDataloaded = true;

  final User _usr = User(
    userName: 'Abdelrahman Bonna',
    imageURL: 'https://picsum.photos/200',
    bankBalance: 50000.00,
    cashBalance: 2000.00,
  );

  bool get raiseNav => _raiseNav;
  bool get userDataloaded => _userDataloaded;
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
}
