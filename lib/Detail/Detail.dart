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
                  child: ListView.builder(
                      itemCount: this.widget.colors.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
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
