import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:game/thirdGame/drawn_line.dart';
import 'package:game/thirdGame/sketcher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:screenshot/screenshot.dart';

class DrawingPage extends StatefulWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  ScreenshotController screenshotController = ScreenshotController();
  Client client = http.Client();

  final GlobalKey _globalKey = GlobalKey();
  List<DrawnLine> lines = <DrawnLine>[];
  DrawnLine line = DrawnLine([], Colors.black, 0);
  Color selectedColor = Colors.black;
  double selectedWidth = 5.0;

  dynamic backGround = AssetImage("images/whitePage.jpg");
  int done = -1;
  dynamic img1;
  dynamic img2;

  StreamController<List<DrawnLine>> linesStreamController = StreamController<List<DrawnLine>>.broadcast();
  StreamController<DrawnLine> currentLineStreamController = StreamController<DrawnLine>.broadcast();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      img1 = save;
      print(img1);
      setState(() {
        backGround = AssetImage("images/handWriting1.png");
        done++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Container(
        decoration: BoxDecoration(image: DecorationImage(
          image: backGround,
          fit: BoxFit.fill,
        ),),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              buildAllPaths(context),
              buildCurrentPath(context),
              done==0?toolbar():Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCurrentPath(BuildContext context) {
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: RepaintBoundary(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(4.0),
          color: Colors.transparent,
          alignment: Alignment.topLeft,
          child: StreamBuilder<DrawnLine>(
            stream: currentLineStreamController.stream,
            builder: (context, snapshot) {
              return CustomPaint(
                painter: Sketcher(
                  lines: [line],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildAllPaths(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent,
        padding: const EdgeInsets.all(4.0),
        alignment: Alignment.topLeft,
        child: StreamBuilder<List<DrawnLine>>(
          stream: linesStreamController.stream,
          builder: (context, snapshot) {
            return CustomPaint(
              painter: Sketcher(
                lines: lines,
              ),
            );
          },
        ),
      ),
    );
  }

  void onPanStart(DragStartDetails details) {
    dynamic box = context.findRenderObject();
    Offset point = box.globalToLocal(details.globalPosition);
    line = DrawnLine([point], selectedColor, selectedWidth);
  }
  void onPanUpdate(DragUpdateDetails details) {
    dynamic box = context.findRenderObject();
    Offset point = box.globalToLocal(details.globalPosition);

    List<Offset> path = List.from(line.path)..add(point);
    line = DrawnLine(path, selectedColor, selectedWidth);
    currentLineStreamController.add(line);
  }
  void onPanEnd(DragEndDetails details) {
    lines = List.from(lines)..add(line);

    linesStreamController.add(lines);
  }

  Widget toolbar() {
    return Positioned(
      top: 40.0,
      right: 10.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          clearButton(),
          const SizedBox(
            height: 10.0,
          ),
          saveButton(),
          const SizedBox(
            height: 20.0,
          ),
          colorButton(Colors.red),
          colorButton(Colors.blueAccent),
          colorButton(Colors.deepOrange),
          colorButton(Colors.green),
          colorButton(Colors.lightBlue),
          colorButton(Colors.black),
          colorButton(Colors.white),
          const SizedBox(
            height: 40.0,
          ),
          fontSizeButton(5.0),
          fontSizeButton(10.0),
          fontSizeButton(15.0),
        ],
      ),
    );
  }

  Widget fontSizeButton(double strokeWidth) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedWidth = strokeWidth;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: strokeWidth * 2,
          height: strokeWidth * 2,
          decoration: BoxDecoration(color: selectedColor, borderRadius: BorderRadius.circular(50.0)),
        ),
      ),
    );
  }

  Widget colorButton(Color color) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FloatingActionButton(
        mini: true,
        backgroundColor: color,
        child: Container(),
        onPressed: () {
          setState(() {
            selectedColor = color;
          });
        },
      ),
    );
  }

  Future<http.Response> getResults(String img1, String img2){
    return http.post(
        Uri.parse("http://osamafityani.pythonanywhere.com/writing"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control_Allow_Origin": "*",
        },
        body: jsonEncode(<String, List>{
          "images":[img1, img2],
        }));
  }

  Future<dynamic> save() async {
    screenshotController
        .capture(delay: Duration(milliseconds: 10))
        .then((capturedImage) async {
      return base64.encode(capturedImage!);
      });
  }

  Widget saveButton() {
    return GestureDetector(
      onTap: () async{
        setState(() {
          done++;
          backGround=AssetImage("images/whitePage.jpg");
        });
        img2 = save;
        print(img2);

        dynamic response = await getResults(img2, img1);
        String result = "";
        if (response.statusCode == 200) {
          Map resultDict = jsonDecode(response.body);
          result = resultDict["result"];
        }
        print(result);
        // var i=base64.decode(result);
        // backGround = Image.memory(i).image;
      },
      child: const CircleAvatar(
        child: Icon(
          Icons.save,
          size: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget clearButton() {
    Future<void> clear() async {
      setState(() {
        lines = [];
        line = DrawnLine([], Colors.black, 0);
      });
    }

    return GestureDetector(
      onTap: clear,
      child: const CircleAvatar(
        child: Icon(
          Icons.cached,
          size: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }

}
