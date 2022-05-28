import 'dart:async';

import '/button2.dart';

import 'pages/homePage.dart';
import '/thirdGame/temp.dart';
import 'package:flutter/material.dart';

import 'scdGame/scoundGame.dart';
import '/thirdGame/drawing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: DrawingPage(),
      home: DrawingPage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/welcome.png"), fit: BoxFit.fill),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyButton2(
                          color: num == 1 ? Colors.cyan : Colors.white,
                          icon: Icons.face,
                          function: () {
                            setState(() {
                              num = 1;
                            });
                          },
                          text: "6-9",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyButton2(
                          color: num == 2 ? Colors.cyan : Colors.white,
                          icon: Icons.face,
                          function: () {
                            setState(() {
                              num = 2;
                            });
                          },
                          text: "9-12",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyButton2(
                          color: num == 3 ? Colors.cyan : Colors.white,
                          icon: Icons.face,
                          function: () {
                            setState(() {
                              num = 3;
                            });
                          },
                          text: "+12",
                        ),
                      ),
                      Container(
                        height: 10,
                        width: double.infinity,
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
    ;
  }
}
