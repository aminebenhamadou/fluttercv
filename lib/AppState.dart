import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  String _lang = "en";

  String get lang => _lang;

  void changeLang(String newLang) {
    if (_lang == "fr") {
      _lang = "en";
    } else {
      _lang = "fr";
    }
    notifyListeners();
  }


}