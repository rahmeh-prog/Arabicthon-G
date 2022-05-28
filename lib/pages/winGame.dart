import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';
import '/helpers/colors.dart';
import '/pages/signUp.dart';
import '/widgets/Button.dart';

import 'home.dart';

class winGame extends StatelessWidget {
  const winGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Expanded(
                child: Positioned.fill(
              child:
                  Image.asset('assets/images/homePage.png', fit: BoxFit.cover),
            )),
            Center(
                child: Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.white,Colors.black54]),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.fromLTRB(0, 160, 0, 0),
              height: 600,
              width: 300,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 0),

                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:  [
                            Container(
                              child: Text("النقاط: 50 "),
                            ),
                            Text("المستوي: الأول"),
                            Text("بقي لديك القليل لتتقن المستوى, أحسنت!!"),
                            button(
                              text: "العودة للصفحة الرئيسة",
                              textColor: Colors.white,
                              buttonColor: AppColors.BUTTON_COLOR,
                              action: HomePage(),
                            ),
                            button(
                              text: "استمرار",
                              textColor: Colors.white,
                              buttonColor: AppColors.BUTTON_COLOR,
                              action: HomePage(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

            )
            )
          ],
        ),
      ),
    );
  }
}
