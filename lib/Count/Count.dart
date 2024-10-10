import 'package:flutter/material.dart';
import 'package:flutter_firstproject/Provider/CountProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firstproject/Component/CommonWidgetButton.dart';

class Count extends StatelessWidget {
  const Count({super.key});

  static const countRouteName = "/count";

  @override
  Widget build(BuildContext context) {
    // 특정 값을 사용하는 위젯만 새로고침할 때 select를 사용
    final _providerCount = context.select<CountProvider, int>((provider) => provider.nowCount);
    // provicer를 읽기만 하고, 변화를 탐지하지 않음 (return만 함 -> 안에 함수를 쓸 때 유용)
    final _provider = context.read<CountProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("Count"),),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child:
              Text("현재 카운트 $_providerCount", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          ),
          CommonWidgetButton(
              bgColor: Colors.red,
              title: "+",
              tappedAction: () {
                _provider.countIncrease();
              }
              ),
          CommonWidgetButton(
              bgColor: Colors.blue,
              title: "-",
              tappedAction: () {
                _provider.countDecrease();
              }
              ),
        ],
      ),
    );
  }
}
