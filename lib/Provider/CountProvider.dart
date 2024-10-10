import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// provider는 with를 통해 ChangeNotifier를 mixin 받아서 사용함
class CountProvider with ChangeNotifier {
  int _count = 0;

  int get nowCount => _count;

  void countIncrease() {
    _count ++;
    // 값이 변경된 후 notifyListeners()를 호출하여 값이 변경되었음을 알림
    notifyListeners();
  }

  void countDecrease() {
    _count --;
    notifyListeners();
  }
}