import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final Color _nowShowingTitleColor;
  const Detail({Key? key, required Color nowColor}) : _nowShowingTitleColor = nowColor, super(key: key);

  static const detailRouteName = "/detail";

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Widget"), backgroundColor: this.widget._nowShowingTitleColor,),
      body: Text("Welcome to Detail Widget"),
    );
  }
}
