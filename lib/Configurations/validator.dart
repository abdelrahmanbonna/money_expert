import 'constants.dart';

class AppValidator {
  static bool isEGPhoneNumber(String? phone) {
    if (phone == null || phone.isEmpty) {
      return false;
    }
    final exp = RegExp(Constants.egPhonePattern);
    return exp.hasMatch(phone);
  }


  static bool isEmail(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }
    final exp = RegExp(Constants.emailPattern);
    return exp.hasMatch(email);
  }

  static bool isUsername(String? name) {
    if (name == null || name.isEmpty) {
      return false;
    }
    final exp = RegExp(Constants.usernamePattern);

    return exp.hasMatch(name);
  }

  static bool isName(String? name) {
    if (name == null || name.isEmpty) {
      return false;
    }
    final exp = RegExp(Constants.namePattern);

    return exp.hasMatch(name);
  }

  static bool isFirstname(String? name) {
    if (name == null || name.isEmpty) {
      return false;
    }
    final exp = RegExp(Constants.firstnamePattern);

    return exp.hasMatch(name);
  }

  static bool isLastname(String? name) {
    if (name == null || name.isEmpty) {
      return false;
    }
    final exp = RegExp(Constants.lastnamePattern);

    return exp.hasMatch(name);
  }

  static bool isPassword(String? password) {
    if (password == null || password.isEmpty || password.length < 6) {
      return false;
    }
    final exp = RegExp(Constants.passwordPatternSpecial);
    final exp1 = RegExp(Constants.passwordPatternNumeric);

    return exp.hasMatch(password) || exp1.hasMatch(password);
  }

  // static bool confirmPassword(String? password, String? confirmPass) {
  //   if (confirmPass == null || confirmPass.isEmpty || confirmPass.length < 6) {
  //     return false;
  //   }
  //   if (password == confirmPass) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
