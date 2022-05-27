import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '/button.dart';
import '/boy.dart';
import '/gamesScreen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int boySpriteCount = 1;
  double boyPosx = -0.1;
  String boyDirection = 'right';

  void startGame() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameScreen()),
    );
  }

  void randomMove() {
    Timer.periodic(Duration(microseconds: 999900), (timer) {
      setState(() {
        boySpriteCount++;

        // if (boyDirection == 'left') {
        //   boyPosx -= 0.01;
        // } else {
        //   boyPosx += 0.01;
        // }
        //
        // if (boyPosx < 0.3) {
        //   boyDirection = 'right';
        // } else if (boyPosx > 0.6) {
        //   boyDirection = 'left';
        // }

        if (boySpriteCount == 17) {
          boySpriteCount = 1;
        }
      });
    });
  }

  void sleep() {
    setState(() {
      boySpriteCount++;
      boyDirection = 'left';
    });
  }

  void eat() {
    setState(() {
      boySpriteCount++;
      boyDirection = 'right';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: 0.2,
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment(boyPosx, 1.2),
                          child: MyBoy(
                              boySpriteCount: boySpriteCount % 16 + 1,
                              boyDirection: boyDirection),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                height: 100,
                color: Colors.grey[500],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      icon: Icons.shopping_cart_outlined,
                      function: () {},
                    ),
                    MyButton(
                      icon: Icons.videogame_asset_outlined,
                      function: () {
                        startGame();
                      },
                    ),
                    MyButton(
                      icon: Icons.fastfood_outlined,
                      function: () {
                        eat();
                      },
                    ),
                    MyButton(
                      icon: Icons.bathtub_outlined,
                      function: () {
                        randomMove();
                      },
                    ),
                    MyButton(
                      icon: Icons.bedtime_outlined,
                      function: () {
                        sleep();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
