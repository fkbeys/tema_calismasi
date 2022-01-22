import 'package:flutter/material.dart';
import 'package:tema_calismasi/widgets/custom_toast_messager.dart';

class GenericProviderMethods extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool durum = false;

  void temadegistir() {
    durum = !durum;
    if (durum == false) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    customToastMessager("Tema degistirildi.");
    notifyListeners();
  }
}
