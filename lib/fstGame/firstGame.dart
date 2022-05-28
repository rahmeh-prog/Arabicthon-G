import '/fstGame/components/gameCard.dart';
import 'package:flutter/material.dart';
import '/fstGame/components/resultCard.dart';
import '/fstGame//global.dart' as global;

class FirstGame extends StatefulWidget {
  const FirstGame({Key? key}) : super(key: key);

  @override
  _FirstGameState createState() => _FirstGameState();
}

class _FirstGameState extends State<FirstGame> {
  int tries = 0;
  int score = 0;

  void cardSelecter(int index) {
    setState(() {
      global.card1 == 0
          ? global.card1 = index
          : global.card2 == 0
              ? global.card2 = index
              : {global.card1 = global.card2 = 0, tries++};
    });
    print("card1: ${global.card1}  card2: ${global.card2}");
  }

  void cardChecker() {
    switch (global.card1) {
      case 1:
        global.card2 == 3 ? score += 10 : null;
        break;
      case 2:
        global.card2 == 5 ? score += 10 : null;
        break;
      case 3:
        global.card2 == 1 ? score += 10 : null;
        break;
      case 4:
        global.card2 == 8 ? score += 10 : null;
        break;
      case 5:
        global.card2 == 2 ? score += 10 : null;
        break;
      case 6:
        global.card2 == 7 ? score += 10 : null;
        break;
      case 7:
        global.card2 == 6 ? score += 10 : null;
        break;
      case 8:
        global.card2 == 4 ? score += 10 : null;
        break;
      case 9:
        global.card2 == 14 ? score += 10 : null;
        break;
      case 10:
        global.card2 == 16 ? score += 10 : null;
        break;
      case 11:
        global.card2 == 12 ? score += 10 : null;
        break;
      case 12:
        global.card2 == 11 ? score += 10 : null;
        break;
      case 13:
        global.card2 == 15 ? score += 10 : null;
        break;
      case 14:
        global.card2 == 9 ? score += 10 : null;
        break;
      case 15:
        global.card2 == 13 ? score += 10 : null;
        break;
      case 16:
        global.card2 == 10 ? score += 10 : null;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/scoundGame/backGround.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 12.0,
            ),
            Center(
              child: Text(
                "تحسين الإملاء",
                style: TextStyle(
                  fontFamily: "arabic",
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: resultCard("$tries", "المحاولات ", "$score", "النتيجة " ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            GameCard(
                              text: "أريد",
                              index: 10,
                              onTap: () {
                                cardSelecter(10);
                                cardChecker();
                              },
                            ),
                            GameCard(
                              text: "خبز",
                              index: 13,
                              onTap: () {
                                cardSelecter(13);
                                cardChecker();
                              },
                            ),
                            GameCard(
                              text: "الآن",
                              index: 1,
                              onTap: () {
                                cardSelecter(1);
                                cardChecker();
                              },
                            ),
                            GameCard(
                              text: "نافذة",
                              index: 14,
                              onTap: () {
                                cardSelecter(14);
                                cardChecker();
                              },
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            GameCard(
                              text: "عيش",
                              index: 15,
                              onTap: () {
                                cardSelecter(15);
                                cardChecker();
                              },
                            ),
                            GameCard(
                              text: "طاقة",
                              index: 9,
                              onTap: () {
                                cardSelecter(9);
                                cardChecker();
                              },
                            ),
                            GameCard(
                              text: "سيء",
                              index: 5,
                              onTap: () {
                                cardSelecter(5);
                                cardChecker();
                              },
                            ),
                            GameCard(
                              text: "أين",
                              index: 7,
                              onTap: () {
                                cardSelecter(7);
                                cardChecker();
                              },
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            GameCard(
                              text: "ماء",
                              index: 8,
                              onTap: () {
                                cardSelecter(8);
                                cardChecker();
                              },
                            ),
                            GameCard(
                              text: "هاتف",
                              index: 11,
                              onTap: () {
                                cardSelecter(11);
                                cardChecker();
                              },
                            ),
                            GameCard(
                              text: "فين",
                              index: 6,
                              onTap: () {
                                cardSelecter(6);
                                cardChecker();
                              },
                            ),
                            GameCard(
                              text: "خايس",
                              index: 2,
                              onTap: () {
                                cardSelecter(2);
                                cardChecker();
                              },
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            GameCard(
                              text: "جوال",
                              index: 12,
                              onTap: () {
                                cardSelecter(12);
                                cardChecker();
                              },
                            ),
                            GameCard(
                              text: "مويا",
                              index: 4,
                              onTap: () {
                                cardSelecter(4);
                                cardChecker();
                              },
                            ),
                            GameCard(
                              text: "دلحين",
                              index: 3,
                              onTap: () {
                                cardSelecter(3);
                                cardChecker();
                              },
                            ),
                            GameCard(
                              text: "أبغي",
                              index: 16,
                              onTap: () {
                                cardSelecter(16);
                                cardChecker();
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
