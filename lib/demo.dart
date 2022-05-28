import 'package:arabicthon/scdGame/main.dart';
import 'package:flutter/material.dart';
import '/thirdGame/temp.dart';

void main() => runApp(myApp());




class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DrawingPage(),
    );
  }
}