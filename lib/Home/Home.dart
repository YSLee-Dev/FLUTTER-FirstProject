import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_firstproject/Detail/Detail.dart';
import 'package:flutter_firstproject/Layout/LayoutPlayground.dart';

// Stateful Widget
// 화면구성이 상태 변화에 따라 변경되어야 할 때 사용되는 상태가 있는 위젯 클래스
// Class 내부에 있는 프로퍼티가 위젯 내부에서 사용될 경우 State라고 칭하며, setState{}를 통해
// 프로퍼티의 값을 변경시키게 되면 Widget build()가 재실행되어 위젯을 업데이트함

// Stateful Widget은 State를 반환하는 메서드만 작성한 후, 해당 State를 상속받는 클래스에
// widget를 정의하여 구현함
class MyHomePage extends StatefulWidget {
  // 생성자로, Super.key로 부모에 생성자를 초기화 시킨다.
  // Key는 해당 위젯을 식별하는 고유 식별자 역할을 함
  // 위젯 트리에서 위치가 변경되어도 Key 값은 그대로이기 때문에 상태를 기억해야할 때 사용함
  const MyHomePage({super.key});

  static const homeRouteName = "/home";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color Function() _getRandomColor = () {
    Random random = Random();
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.deepPurpleAccent,
      Colors.pink,
      Colors.teal,
      Colors.cyan,
    ];
    return colors[random.nextInt(colors.length)];
  };

  Color _nowTitleBGColor = Colors.red;

  @override
  Widget build(BuildContext context) {

    // 디자인 적인 뼈대를 구성하는 위젯 (Scaffold)
    // View를 템플릿처럼 생성하는 것
    // AppBar, Body 등 다양한 속성이 존재함
    return Scaffold(
        appBar: AppBar(title: const Text("firstApp")),
        // Child 위젯을 상하로 쌓을 수 있는 위젯
        body: Column(
          children: [
            Container(
              color: _nowTitleBGColor,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Text("안녕 Flutter는 처음이지?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            SizedBox(height: 50),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.green
                ),
                onPressed: () {
                  setState(() {
                   Color nowRandomColor = _getRandomColor();
                    while (nowRandomColor == _nowTitleBGColor) {
                      nowRandomColor = _getRandomColor();
                    }
                   _nowTitleBGColor = nowRandomColor;
                   });
                },
                child: Text("버튼을 눌러서 타이틀을 변경할 수 있어요.", style: TextStyle(color: Colors.white),)
            ),
            SizedBox(height: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey
                ),
                onPressed: () async {
                  // Flutter에서는 Navigator를 이용해 화면 전환을 할 수 있음
                  // Navigator.push, pushNamed 등이 있으며, pushNamed는
                  // 최상위 위젯에서 정의해 놓은 routes를 기반으로 Key 값 (String)에 맞는
                  // Route에 맞춰 이동함
                  final colorTapped = await Navigator.pushNamed(context, Detail.detailRouteName, arguments: _nowTitleBGColor);
                  setState(() {
                    _nowTitleBGColor = colorTapped is Color ? colorTapped : _nowTitleBGColor;
                  });
                },
                child: Text("버튼을 눌러서 타이틀 컬러를 볼 수 있어요.", style: TextStyle(color: Colors.white),)
            ),
            SizedBox(height: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent
                ),
                onPressed: () {
                 Navigator.pushNamed(context, LayoutPlayground.layoutPlaygroundRouteName);
                },
                child: Text("버튼을 눌러서 다양한 레이아웃을 볼 수 있어요.", style: TextStyle(color: Colors.white),)
            )
          ],
        )
    );
  }
}
