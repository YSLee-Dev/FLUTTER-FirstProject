import 'package:flutter/material.dart';

class LayoutPlayground extends StatelessWidget {
  const LayoutPlayground({super.key});

  static const layoutPlaygroundRouteName = "/LayoutPlayground";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LayoutPlayground"),),
      // Flutter는 부모 위젯이 자식 위젯에게 크기에 대한 제약조건을 전달한 후 자식이 해당 제약조건을 기반으로 사이즈를 결정함
      // 그 후 자식은 부모 위젯에게 자신의 사이즈를 전달하며, 부모 위젯은 이를 배치하게 됨
      // + 자식 위젯은 부모가 전달한 제약조건을 넘을 수 없음
      body: Column(
        children: [
          // Container는 사이즈가 정해져 있지 않고, 자식 위젯이 없으면 최대로 확장하려고 하는 성질이 있음
          // 하단 Black Container는 height만 100으로 정해져있고, width가 없기 때문에 height는 100, width는 화면을 꽉 채우게됨
          // width가 화면을 꽉 채울 수 있는 조건은 Column으로 부터 전달됨

          // Column은 Screen으로 부터 화면 전체 사이즈를 받아, child인 Container에게 최대 width/height, 최소 width/height를 전달하게 됨
          // Black Container는 height는 100으로 설정하며, width는 최대한 확장하고 싶지만, 최대 width가 Screen의 width이니 해당 값을 가지게 됨
          Container(
            color: Colors.black,
            height: 100,
          ),

          // Container 사이즈는 정해지지 않았지만, 자식 위젯이 있을 경우, 자식 위젯 사이즈로 Container 사이즈를 맞추게 됨
          // 하단의 Red Container는 사이즈를 정하지 않은 상태로 자식 Blue Container를 가지고 있음

          // Red Container는 Column으로 부터 받은 제약조건을 그대로 자녀 Blue Container에게 전달함
          // Blue Container는 자신만의 사이즈 100 * 100을 정한 후 부모에게 통보함
          // Blue Container의 사이즈를 전달받은 Red Container는 자신 또한 동일한 크기로 결정 후 부모인 Column에게 통보함
          // Blue Container와 Red Container는 동일한 사이즈를 가지게 됨
          Container(
            color: Colors.red,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),

          // Container 사이즈가 정해지고, 자식 위젯까지 있는 경우, Container는 자식 위젯에게 부모 위젯의 크기를 강제함
          // 하단의 Yellow Container는 200 * 200 사이즈를 가지고 있으며, Green Container를 자식으로 가지고 있음

          // Yellow Container는 Column으로 부터 받은 제약조건 중 자신만의 사이즈인
          // 200 * 200 으로 자신의 제약조건을 결정한 후 Green Container에게 제약조건을 전달함 (Column은 스크린 사이즈를 주기 때문에 문제 없음)
          // Green Container는 자신만의 사이즈인 100 * 100으로 설정하고 싶지만, 제약조건 중 min 크기가 되지 않기 때문에 부모에서 강제한 크기인
          // 200 * 200을 따르게 되며 이를 Yellow Container에게 전달함 (하단 print 문 참고)
          // Green Container의 사이즈를 전달받은 Yellow Container는 200 * 200 으로 크기를 결정 후 부모인 Column에게 통보함
          // Yellow Container와 Green Container는 동일한 사이즈를 가지게 됨
          Container(
            width: 200,
            height: 200,
            color: Colors.yellow,
            child: LayoutBuilder(
              builder: (context, constraints) {
                print("Yellow Container로 부터 받은 min 제약 조건 " + "width: ${constraints.minWidth} " + "height: ${constraints.minHeight}");
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                );
              },
            ),
          ),

          // Text,Image는 특정 값으로 사이즈가 결정됨
          // 하단의 Text는 해당 String 문자열 만큼의 width이며, Container는 사이즈가 정해져 있지 않고, 자식 위젯만 있기 때문에 Text와 동일한 사이즈를 가짐
          Container(
            color: Colors.orange,
            child: Text("나는 텍스트 Text 입니다."),
          ),

          // Trasform, Opacity는 자식 위젯과 동일한 사이즈로 결정됨
          // 하단의 Text는 해당 String 문자열 만큼의 width이며, Opacity는 자식 위젯과 동일한 사이즈를 가지기 때문에 Text 위젯의 사이즈와 동일함
          // Container 또한 사이즈가 정해져 있지 않고, 자식 위젯만 있기 떄문에 Opacity는와 동일한 사이즈를 가짐
          Container(
            color: Colors.indigo,
            child: Opacity(
              opacity: 0.5,
              child: Text("나는 Opacity안에 있는 텍스트 Text 입니다.", style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
