import 'package:flutter/material.dart';

class LayoutPlayground extends StatelessWidget {
  const LayoutPlayground({super.key});

  static const layoutPlaygroundRouteName = "/LayoutPlayground";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LayoutPlayground"),),
      body: Text("LayoutPlayground"),
    );
  }
}
