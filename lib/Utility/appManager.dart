import 'package:flutter/material.dart';

class AppManager extends ChangeNotifier {
  bool userSignedIn = false;

  void setUserSignedIn(bool val) {
    userSignedIn = val;
    notifyListeners();
  }
}
