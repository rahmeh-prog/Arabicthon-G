import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Widget resultCard(String title, String info) {
  return Material(
    color: Colors.white,
    elevation: 5,
    borderRadius: BorderRadius.circular(8),
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(children: [
        Text(
          title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          info,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )
      ]),
    ),
  );
}
