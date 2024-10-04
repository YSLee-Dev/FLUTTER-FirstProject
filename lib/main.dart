import 'package:flutter/material.dart';
import 'package:flutter_firstproject/Layout/LayoutPlayground.dart';
import 'Detail/Detail.dart';
import 'Home/Home.dart';

// 앱의 시작부분 (Swift = @Main)
// 앱을 실행하면 Main()을 찾아 실행하게 됨
void main() {
  runApp(MyApp());
}

// StatelessWidget
// 상태를 가지지 않는 위젯 클래스
// 내부의 UI 위젯들은 상태를 가질 수 없음 -> widget build()는 처음 위젯을 그릴 때만 호출됨
class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Routes는 Navigator에서 pushNamed 메소드를 이용할 때 사용됨
  // - 최상위 widget에 routes에 미리 정의해야함
  // - 미리 정의해놓은 Routes를 통해 편리하게 화면전환을 할 수 있음

  // Route는 Navigator에서 화면을 이동할 때 사용되는 객체
  // Navigator는 Stack을 통해 화면을 관리하는데, widget을 바로 표시하고, 숨기는 것이 아닌, 화면에 대한 정보를 담는 route를 통해
  // 화면 전환을 함 (Navigator Stack에 추가/제거되는 객체가 Route)
  // Route에는 화면에 표시될 widget과 화면전환 애니메이션등을 정의함
  final routes = {
    MyHomePage.homeRouteName: (context) => MyHomePage(),
    Detail.detailRouteName: (context) {
      // context에 있는 값을 꺼내서 전달
      final argument = ModalRoute.of(context)?.settings.arguments;
      return Detail(nowColor: argument is Color ? argument : Colors.red);
    },
    LayoutPlayground.layoutPlaygroundRouteName: (context) => LayoutPlayground()
  };

  // 구현한 UI 위젯을 화면에 출력하게 해주는 메서드
  // BuildContext 타입은 현재 위젯의 위젯 트리상의 정보를 담고 있음
  // -> return 하는 위젯의 부모 위젯에 대한 위치를 담고 있음
  // -> 현재는 MyApp
  @override
  Widget build(BuildContext context) {
    // 최상위 widget에는 앱의 기본적인 구조와 디자인을 정의하는 데 사용되는 위젯이 정의되어야 함
    // MaterialApp는 AOS 스타일, CupertinoApp는 iOS 스타일
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      routes: routes,
    );
  }
}