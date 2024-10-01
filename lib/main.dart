import 'package:flutter/material.dart';
import 'Home/Home.dart';

// 앱의 시작부분 (Swift = @Main)
// 앱을 실행하면 Main()을 찾아 실행하게 됨
void main() {
  runApp(const MyApp());
}

// StatelessWidget
// 상태를 가지지 않는 위젯 클래스
// 내부의 UI 위젯들은 상태를 가질 수 없음 -> widget build()는 처음 위젯을 그릴 때만 호출됨
class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
    );
  }
}