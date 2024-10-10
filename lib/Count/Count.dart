import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Count extends StatelessWidget {
  const Count({super.key});

  static const countRouteName = "/count";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Count"),),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child:
            Text("현재 카운트", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          )
        ],
      ),
    );
  }
}
