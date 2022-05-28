import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget letter(String character, bool hidden) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 65,
        width: 50,
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: Color(0xffF76E6E),
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
              color: Colors.black,
              width: 5
            )),
        child: Visibility(
          visible: !hidden,
          child: Center(
            child: Text(
              character,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
