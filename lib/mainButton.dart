import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final icon;
  final function;

  MyButton({this.icon, this.function});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        onPressed: function,
        elevation: 2.0,
        fillColor: Colors.white,
        child: Icon(
          icon,
          size: 30.0,
        ),
        padding: EdgeInsets.all(15.0),
        shape: CircleBorder(),
      ),
    );
  }
}
