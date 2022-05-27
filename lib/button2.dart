import 'package:flutter/material.dart';

class MyButton2 extends StatelessWidget {
  final icon;
  final function;
  final text;
  final color;

  MyButton2({this.color, this.icon, this.function, this.text});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: function,
      elevation: 2.0,
      fillColor: color,
      child: Column(
        children: [
          Icon(
            icon,
            size: 15.0,
          ),
          Text(text ?? ""),
        ],
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );
  }
}
