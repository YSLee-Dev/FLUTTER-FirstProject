import 'package:flutter/material.dart';

// 앱의 시작부분 (Swift = @Main)
// 앱을 실행하면 Main()을 찾아 실행하게 됨
void main() {
  runApp(const MyApp());
}

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // 디자인 적인 뼈대를 구성하는 위젯 (Scaffold)
    // View를 템플릿처럼 생성하는 것
    // AppBar, Body 등 다양한 속성이 존재함
    return Scaffold(
      appBar: AppBar(title: Text("firstApp")),
      // Child 위젯을 상하로 쌓을 수 있는 위젯
      body: Column(
        children: [
          Text("Hello world")
        ],
      )
    );
  }
}
