import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class LoginViewModel extends ViewModel {
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();
bool _showPassword = false;

  bool get showPassword => _showPassword;

  void setShowPassword(bool v) {
    _showPassword = v;
    notifyListeners();
  }
}
