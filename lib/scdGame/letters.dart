import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget letter(String character, bool hidden) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 65,
        width: 50,
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Color(0xFF231954),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Visibility(
          visible: !hidden,
          child: Center(
            child: Text(
              character,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
