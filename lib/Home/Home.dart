import 'package:flutter/material.dart';

// Stateful Widget
// 화면구성이 상태 변화에 따라 변경되어야 할 때 사용되는 상태가 있는 위젯 클래스
// Class 내부에 있는 프로퍼티가 위젯 내부에서 사용될 경우 State라고 칭하며, setState{}를 통해
// 프로퍼티의 값을 변경시키게 되면 Widget build()가 재실행되어 위젯을 업데이트함

// Stateful Widget은 State를 반환하는 메서드만 작성한 후, 해당 State를 상속받는 클래스에
// widget를 정의하여 구현함
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
