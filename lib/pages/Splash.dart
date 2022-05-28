
import 'package:flutter/material.dart';

import 'Welcome.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(duration: 3, goToPage: const Welcome()),
  ));
}

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage = const Welcome();

  SplashPage({Key? key, required this.goToPage, required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => goToPage));
    });
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Expanded(
                child: Positioned.fill(
                  child: Image.asset('assets/images/splash.png',
                      fit: BoxFit.cover),
                ),
              )
            ],
          )
      ),
    );
  }
}


