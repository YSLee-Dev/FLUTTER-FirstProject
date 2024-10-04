import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final Color _nowShowingTitleColor;
  Detail({Key? key, required Color nowColor}) : _nowShowingTitleColor = nowColor, super(key: key) {
    colors.remove(_nowShowingTitleColor);
  }

  static const detailRouteName = "/detail";

  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.deepPurpleAccent,
    Colors.pink,
    Colors.teal,
    Colors.cyan
  ];

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    // PopScope를 사용하여 제스처, 버튼을 통한 Navigator.pop()을 방지할 수 있음
    // canPop에 가능 여부를 넣으며, onPopInvokedWithResult(){}를 통해 이벤트 여부를 받을 수 있음
    // AOS 14 이상 버전부터 제공되는 추가 기능으로 인해 WillPopScope는 사용하지 않게 됨
    return PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(title: Text("Detail Widget"), backgroundColor: this.widget._nowShowingTitleColor,),
          body: Column(
            children: [
              Container(
                color: this.widget._nowShowingTitleColor,
                child: Text("Home에서 사용하고 싶은 색상을 선택하세요.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                padding: EdgeInsets.only(top: 20, bottom: 20),
                width: double.infinity,
              ),
              SizedBox(
                width: double.infinity,
                height: 30,
              ),
              Expanded(
                // List에 있는 값을 이용하여 여러개의 Widget과 스크롤 가능한 Widget을 만드는 Widget
                  child: ListView.builder(
                      itemCount: this.widget.colors.length,
                      itemBuilder: (BuildContext context, int index) {
                        // 다양한 제스처를 받을 수 있는 Widget
                        return GestureDetector(
                          onTap: () {
                            // pop을 하면서 데이터를 전달할 경우 push를 했던 부모에게 데이터가 전달됨
                            Navigator.pop(context, this.widget.colors[index],);
                          },
                          child: Container(
                              color: this.widget.colors[index],
                              child:
                              SizedBox(
                                width: double.infinity,
                                height: 60,
                              )
                          ) ,
                        );
                      }
                  ),
              )
            ],
          ),
        )
    );
  }
}
