import 'package:flutter/foundation.dart';

class BottomNavProvider extends ChangeNotifier {
  int bottomNavIndex = 0;

  changeScreen(int index) {
    bottomNavIndex = index;
    notifyListeners();
  }
}
