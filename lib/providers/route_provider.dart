import 'package:flutter/material.dart';

class RouteProvider with ChangeNotifier {
  int _currentIndex = 999;

  int get currentIndex {
    return _currentIndex;
  }

  void updateRoute (int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  void resetRoute() {
    _currentIndex = 999;
    notifyListeners();
  }
}