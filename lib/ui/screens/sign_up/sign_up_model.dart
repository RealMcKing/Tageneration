import 'package:flutter/cupertino.dart';

class SignUpViewModel extends ChangeNotifier {
  bool _isObscure = true;

  bool get isObscure => _isObscure;

  void visibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }
}
