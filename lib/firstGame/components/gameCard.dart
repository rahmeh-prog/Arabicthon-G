import 'package:flutter/material.dart';

import '/global.dart' as global;

class GameCard extends StatelessWidget {
  final onTap;
  final hidden;
  final index;
  final text;

  GameCard({required this.index, this.onTap, this.hidden, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.lightBlueAccent,
                  Colors.pinkAccent,
                ],
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: index == global.card1 || index == global.card2
                ? Center(
                    child: Text(
                    text,
                    style: TextStyle(
                        fontFamily: 'arabic',
                        fontSize: 40,
                        color: Colors.white),
                  ))
                : Center(
                    child: Icon(
                      Icons.question_mark,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
