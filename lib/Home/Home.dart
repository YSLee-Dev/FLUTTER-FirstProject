import 'package:flutter/material.dart';

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
