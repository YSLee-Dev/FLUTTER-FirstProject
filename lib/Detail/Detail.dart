import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  static const detailRouteName = "/detail";

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Widget"),),
      body: Text("Welcome to Detail Widget"),
    );
  }
}
