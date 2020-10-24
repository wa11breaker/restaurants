import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _index = 0;
  int get index => _index;

  setindex(int index) {
    _index = index;
    notifyListeners();
  }
}
