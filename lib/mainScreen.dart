import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../boy.dart';
import '../mainButton.dart';
import 'gamesScreen.dart';

class mainScreen extends StatefulWidget {
  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  int boySpriteCount = 1;
  double boyPosx = -0.1;
  String boyDirection = 'right';

  void startGame() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/homePage.png"),
            fit: BoxFit.fill
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
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
            Container(
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
                    },
                  ),
                  MyButton(
                    icon: Icons.bathtub_outlined,
                    function: () {
                    },
                  ),
                  MyButton(
                    icon: Icons.bedtime_outlined,
                    function: () {
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
