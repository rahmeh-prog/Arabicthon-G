import 'package:flutter/material.dart';

class Game {
  final Color hiddenCard = Colors.red;
  List<Color>? gameColors;
  List<String>? gameImg;
  List<Color> cards = [
    Colors.green,
    Colors.yellow,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.blue
  ];
  final String hiddenCardpath = "images/test1.png";
  List<String> cards_list = [
    "images/test1.png",
    "images/test2.png",
    "images/tset3.png",
    "images/test4.png",
    "images/test1.png",
    "images/test2.png",
    "images/tset3.png",
    "images/test4.png",
  ];
  final int cardCount = 8;
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGame() {
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    print(gameColors);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
    print(gameImg);
  }
}
