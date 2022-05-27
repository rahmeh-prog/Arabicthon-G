import 'package:game/scdGame/scoundGame.dart';
import 'package:flutter/material.dart';
import 'package:game/boy.dart';
import 'firstGame/firstGame.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int boySpriteCount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  gameContainer(
                    onTap: () {
                      setState(() {
                        boySpriteCount == 1
                            ? boySpriteCount = 8
                            : boySpriteCount = 1;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FirstGame()));
                    },
                    color: Colors.deepPurple,
                    text: "المقابل الفصيح",
                    icon: Icons.quiz,
                  ),
                  gameContainer(
                    onTap: () {
                      setState(() {
                        boySpriteCount == 1
                            ? boySpriteCount = 8
                            : boySpriteCount = 1;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => scoundGame()));
                    },
                    color: Colors.red,
                    icon: Icons.import_contacts,
                    text: "تحسين الإملاء",
                  ),
                  gameContainer(
                    onTap: () {
                      setState(() {
                        boySpriteCount == 1
                            ? boySpriteCount = 8
                            : boySpriteCount = 1;
                      });
                    },
                    color: Colors.yellow,
                    text: "إثراء المفردات",
                    icon: Icons.travel_explore,
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              alignment: Alignment(-0.1, 1.128),
              child: MyBoy(
                  boySpriteCount: boySpriteCount % 16 + 1,
                  boyDirection: 'left'),
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                gameContainer(
                  onTap: () {
                    setState(() {
                      boySpriteCount == 1
                          ? boySpriteCount = 8
                          : boySpriteCount = 1;
                    });
                  },
                  color: Colors.green,
                  text: "تحسين النطق",
                  icon: Icons.record_voice_over,
                ),
                gameContainer(
                  onTap: () {
                    setState(() {
                      boySpriteCount == 1
                          ? boySpriteCount = 8
                          : boySpriteCount = 1;
                    });
                  },
                  color: Colors.pink,
                  text: "تحسين التراكيب",
                  icon: Icons.school,
                ),
                gameContainer(
                  onTap: () {
                    setState(() {
                      boySpriteCount == 1
                          ? boySpriteCount = 8
                          : boySpriteCount = 1;
                    });
                  },
                  color: Colors.orange,
                  icon: Icons.draw,
                  text: "تحسين الخط",
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class gameContainer extends StatelessWidget {
  Function() onTap;
  Color color;
  final icon;
  final text;

  gameContainer(
      {this.icon, required this.onTap, required this.color, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: onTap,
          child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 5,
              color: color,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text ?? " ",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'arabic',
                        fontSize: 30),
                  ),
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 40,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
