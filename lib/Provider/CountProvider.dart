import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CountProvider with ChangeNotifier {
  int _count = 0;

  void countIncrease() {
    _count ++;
    notifyListeners();
  }

  void countDecrease() {
    _count --;
    notifyListeners();
  }
}