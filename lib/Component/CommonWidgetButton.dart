import 'package:flutter/material.dart';

class CommonWidgetButton extends StatelessWidget {
  final String _btnTitle;
  final Color _btnBGColor;
  Function() _tappedAction;

  CommonWidgetButton({required Color bgColor, required String title, required Function() tappedAction, Key? key})
      : _btnBGColor = bgColor, _btnTitle = title, _tappedAction = tappedAction, super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: _btnBGColor
        ),
        onPressed: () async {
          _tappedAction();
        },
        child: Text("$_btnTitle", style: TextStyle(color: Colors.white),)
    );
  }
}
