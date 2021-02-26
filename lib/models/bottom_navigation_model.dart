import 'package:flutter/material.dart';
import 'package:learn_app_state_with_provider/screens/thumbnail_screen.dart';
import 'package:learn_app_state_with_provider/screens/title_screen.dart';
import 'package:learn_app_state_with_provider/screens/url_screen.dart';

class BottomNavigationData extends ChangeNotifier {
  int _selectedIndex;

  BottomNavigationData([this._selectedIndex = 0]);
  List<Color> _colorData = <Color>[
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  List<Color> get colorData => _colorData;

  List<Widget> _widgetOptions = <Widget>[
    TitleScreen(),
    ThumbnailScreen(),
    UrlScreen()
  ];

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Widget widgetOptions() {
    return _widgetOptions[_selectedIndex];
  }
}
