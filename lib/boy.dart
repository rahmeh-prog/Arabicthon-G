import 'package:flutter/material.dart';
import 'dart:math';

class MyBoy extends StatelessWidget {
  final int boySpriteCount;
  final String boyDirection;

  MyBoy({required this.boySpriteCount, required this.boyDirection});

  @override
  Widget build(BuildContext context) {
    if (boyDirection == 'left') {
      return Container(
        alignment: Alignment.bottomCenter,
        height: 300,
        width: 300,
        child: Image.asset('images/test$boySpriteCount.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 300,
          width: 300,
          child: Image.asset('images/test$boySpriteCount.png'),
        ),
      );
    }
  }
}
