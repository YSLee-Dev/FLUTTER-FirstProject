import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// provider는 with를 통해 ChangeNotifier를 mixin 받아서 사용함
class CountProvider with ChangeNotifier {
  int _count = 0;
  bool _isMounted = true;

  int get nowCount => _count;

  void countIncrease() {
    _count ++;
    // 값이 변경된 후 notifyListeners()를 호출하여 값이 변경되었음을 알림
    // 비동기 함수이기 때문에 실행이 바로 되지 않음

    // dispose() 된 다음에 notifyListeners()가 불릴 경우 에러가 발생하게 됨
    // State는 mounted 값이 있기 때문에 dispose() 이후 setState()를 호출하지 않음

    // Provider는 Dispose()가 실행되었는지 알려주지 않음
    // Dispose()가 된 경우 작동하지 않도록 개발이 필요함
    this.notifyListeners();
  }

  void countDecrease() {
    _count --;
    this.notifyListeners();
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_isMounted) {return;}
    super.notifyListeners();
  }
}