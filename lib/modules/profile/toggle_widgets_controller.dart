import 'package:flutter/material.dart';

class ToggleWidgetsController with ChangeNotifier {
  int _currentPage;
  List<Widget> _children;

  ToggleWidgetsController()
      : _children = [],
        _currentPage = 0;

  Widget get currentPage => _children[_currentPage];

  void toggleWidget() {
    if (_currentPage == 0) {
      _currentPage += 1;
    } else {
      _currentPage -= 1;
    }

    notifyListeners();
  }

  set children(List<Widget> children) {
    _children = children;
  }
}
