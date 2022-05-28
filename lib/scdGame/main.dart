import 'package:flutter/material.dart';
import '/scdGame/figureImage.dart';
import '/scdGame/letters.dart';
import '/scdGame/utils.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

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
  String word = "ملعب".toUpperCase();

  int result = 0;
  int startd = 0;

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

  List<Widget> figureBuilder() {
    List<Widget> widgets = [];
    for (int i = 0; i < 7; i++) {
      var newItem = Container(
        child: figureImage(Game.tries == Game.tries,
            "images/firstGame/f${Game.tries + 1}.png"),
      );
      widgets.add(newItem);
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/firstGame/backGround.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(onPressed: (){AssetsAudioPlayer.newPlayer().open(
                  Audio("assets/voice.mp3"),
                  autoStart: true,
                  showNotification: true,
                );}, icon: Icon(Icons.volume_down), color: Colors.white,),
              ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Container(
                          child: Text(
                        "النقاط: $result ",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          child: Text(
                        " المحاولات المتبقية: ${6 - Game.tries} ",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: startd != 0
                  ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Stack(
                        children: figureBuilder(),
                      ))
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          startd++;
                        });
                        AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/voice.mp3"),
                          autoStart: true,
                          showNotification: true,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffF76E6E),
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "هيا نبدأ",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: word
                    .split('')
                    .reversed
                    .map((e) => letter(e.toUpperCase(),
                        !Game.selectedChar.contains(e.toUpperCase())))
                    .toList(),
              ),
            ),
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
                        ? null
                        : () {
                            setState(() {
                              Game.selectedChar.add(e);
                              print(Game.selectedChar);
                              if (!word.split('').contains(e.toUpperCase())) {
                                Game.tries++;
                              } else
                                result += 10;
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
            ),
          ],
        ),
      ),
    );
  }
}
