import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Widget resultCard(String title, String info, String title1, String info1) {
  return Container(
      decoration: BoxDecoration(
      color: Colors.white,
    borderRadius: BorderRadius.circular(4.0)),
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(children: [Center(
        child: Text(
          "$title : $info",
          style: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
        Center(
          child: Text(
            "$title1 : $info1",
            style: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    ),
  );
}
