import 'package:flutter/material.dart';
import 'package:flutter_firstproject/Component/CommonWidgetButton.dart';

class Detail extends StatefulWidget {
  final Color _nowShowingTitleColor;

  Detail({Key? key, required Color nowColor})
      : _nowShowingTitleColor = nowColor,
        super(key: key) {
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
  bool _isFirstTapped = true;

  @override
  Widget build(BuildContext context) {
    // PopScope를 사용하여 제스처, 버튼을 통한 Navigator.pop()을 방지할 수 있음
    // canPop에 가능 여부를 넣으며, onPopInvokedWithResult(){}를 통해 이벤트 여부를 받을 수 있음
    // AOS 14 이상 버전부터 제공되는 추가 기능으로 인해 WillPopScope는 사용하지 않게 됨
    return PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Detail Widget"),
            backgroundColor: this.widget._nowShowingTitleColor,
          ),
          body: Column(
            children: [
              Container(
                color: this.widget._nowShowingTitleColor,
                child: Text("Home에서 사용하고 싶은 색상을 선택하세요.",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                padding: EdgeInsets.only(top: 20, bottom: 20),
                width: double.infinity,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Spacer(),
                    CommonWidgetButton(
                        bgColor: _isFirstTapped ? Colors.black : Colors.grey,
                        title: "리스트보기",
                        tappedAction: () {
                          setState(() {
                            _isFirstTapped = true;
                          });
                        }),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: CommonWidgetButton(
                          bgColor: !_isFirstTapped ? Colors.black : Colors.grey,
                          title: "격자보기",
                          tappedAction: () {
                            setState(() {
                              _isFirstTapped = false;
                            });
                          }),
                    ),
                    Spacer()
                  ],
                ),
              ),
              // 조건을 통해 특정 위젯만 보여줄 수 있음 (중괄호는 생략)
              if (_isFirstTapped)
                Expanded(
                  // List에 있는 값을 이용하여 여러개의 Widget과 스크롤 가능한 Widget을 만드는 Widget
                  child: ListView.builder(
                      itemCount: this.widget.colors.length,
                      itemBuilder: (BuildContext context, int index) {
                        // 다양한 제스처를 받을 수 있는 Widget
                        return GestureDetector(
                          onTap: () {
                            // pop을 하면서 데이터를 전달할 경우 push를 했던 부모에게 데이터가 전달됨
                            Navigator.pop(
                              context,
                              this.widget.colors[index],
                            );
                          },
                          child: Container(
                              color: this.widget.colors[index],
                              child: SizedBox(
                                width: double.infinity,
                                height: 60,
                              )),
                        );
                      }),
                ),
              if (!_isFirstTapped)
                Expanded(
                  // 격자로 자녀 위젯을 보여줄 수 있는 위젯
                  // ListViw와 동일하게 Builder를 통해 특정 count 만큼 여러개의 위젯을 만들고, 스크롤이 가능하게 함
                    child: GridView.builder(
                      // 한 행에 몇개의 아이템을 표시할건지 정의
                      // GridView는 한 행의 아이템의 개수에 따라 child 위젯의 width를 결정하며,
                      // width 값을 기반으로 childAspectRatio 의 속성에 따라 Child 위젯의 height를 결정함 (비율)
                      // - GridView 내부의 Child 위젯은 width, height를 정할 수 없음 (위 조건으로 인해)
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10
                        ),
                        itemCount: this.widget.colors.length,

                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pop(
                                context,
                                this.widget.colors[index],
                              );
                            },
                            child: Container(
                              color: this.widget.colors[index],
                            ),
                          );
                        })
                )
            ],
          ),
        )
    );
  }
}
