import 'package:flutter/material.dart';
import '/scdGame/figureImage.dart';
import '/scdGame/letters.dart';
import '/scdGame/utils.dart';

class scoundGame extends StatelessWidget {
  const scoundGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeApp();
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  //choosing the game word
  String word = "بطيخ".toUpperCase();
  //Create a list that contains the Alphabet, or you can just copy and paste it
  List<String> alphabets = [
    "خ",
    "ح",
    "ج",
    "ث",
    "ت",
    "ب",
    "أ",
    "ص",
    "ش",
    "س",
    "ز",
    "ر",
    "ذ",
    "د",
    "ق",
    "ف",
    "غ",
    "ع",
    "ظ",
    "ط",
    "ض",
    "ي",
    "و",
    "ه",
    "ن",
    "م",
    "ل",
    "ك",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF39298a),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            "تحسين الإملاء",
            style: TextStyle(
                fontFamily: 'arabic', fontSize: 40, color: Colors.white),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: figureImage(Game.tries == 0, "images/f1.jpg"),
                    color: Colors.white,
                  ),
                  Container(
                    width: double.infinity,
                    child: figureImage(Game.tries == 1, "images/f2.jpg"),
                    color: Colors.white,
                  ),
                  Container(
                    width: double.infinity,
                    child: figureImage(Game.tries == 2, "images/f3.jpg"),
                    color: Colors.white,
                  ),
                  Container(
                    width: double.infinity,
                    child: figureImage(Game.tries == 3, "images/f4.jpg"),
                    color: Colors.white,
                  ),
                  Container(
                    width: double.infinity,
                    child: figureImage(Game.tries == 4, "images/f5.jpg"),
                    color: Colors.white,
                  ),
                  Container(
                    width: double.infinity,
                    child: figureImage(Game.tries == 5, "images/f6.jpg"),
                    color: Colors.white,
                  ),
                  Container(
                    width: double.infinity,
                    child: figureImage(Game.tries >= 6, "images/f7.jpg"),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),

          //Now we will build the Hidden word widget
          //now let's go back to the Game class and add
          // a new variable to store the selected character
          /* and check if it's on the word */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word
                .split('')
                .reversed
                .map((e) => letter(e.toUpperCase(),
                    !Game.selectedChar.contains(e.toUpperCase())))
                .toList(),
          ),
          //Now let's build the Game keyboard
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 7,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(8.0),
              children: alphabets.map((e) {
                return RawMaterialButton(
                  onPressed: Game.selectedChar.contains(e)
                      ? null // we first check that we didn't selected the button before
                      : () {
                          setState(() {
                            Game.selectedChar.add(e);
                            print(Game.selectedChar);
                            if (!word.split('').contains(e.toUpperCase())) {
                              Game.tries++;
                            }
                          });
                        },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  fillColor: Game.selectedChar.contains(e)
                      ? Colors.black87
                      : Colors.blue,
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
