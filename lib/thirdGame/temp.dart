import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'drawn_line.dart';
import 'sketcher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DrawingPage extends StatefulWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  Client client = http.Client();

  final key = GlobalKey();
  final GlobalKey _globalKey = GlobalKey();
  List<DrawnLine> lines = <DrawnLine>[];
  DrawnLine line = DrawnLine([], Colors.black, 0);
  Color selectedColor = Color(0xff00ff00);
  double selectedWidth = 10.0;
  String result = "هيا نبدأ";

  dynamic backGround = AssetImage("images/thirdGame/handWriting1.png");
  int done = 0;
  var img1;
  var img2;

  StreamController<List<DrawnLine>> linesStreamController = StreamController<List<DrawnLine>>.broadcast();
  StreamController<DrawnLine> currentLineStreamController = StreamController<DrawnLine>.broadcast();

  // Container(
  // decoration: BoxDecoration(image: DecorationImage(
  // image: backGround,
  // fit: BoxFit.fill,
  // ),
  // ),

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/thirdGame/backGround.png"), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            RepaintBoundary(key: key, child: Stack(children: [Center(child: Image(image: backGround)),buildAllPaths(context),
              buildCurrentPath(context),])),
            done==1?toolbar():Container(),
            done==0?Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () async{
                      img1 = await base64Encode(await save());
                      setState(() {
                        img1;
                        done=done==0?1:0;
                      });
                    },

                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(50.0)),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                            child: Text(result, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
                      ),
                    ),
                  ),
                ),
              ],
            ):Container(),
          ],
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
            height: 40.0,
          ),
        ],
      ),
    );
  }

  Future<http.Response> getResults(String img1, String img2){
    return http.post(
        Uri.parse("http://osamafityani.pythonanywhere.com/games/handwriting"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control_Allow_Origin": "*",
        },
        body: jsonEncode(<String, List>{
          "images":[img1, img2],
        }));
  }

  void takeScreenState() async{
    img2 = await base64Encode(await save());
    setState(() {
      img2;
      done=done==0?1:0;
    });
    dynamic response = await getResults(img2,img1);
    String resImg = jsonDecode(await response.body)["image"];
    int resText = jsonDecode(await response.body)["accuracy"];
    setState(() {
      backGround = Image.memory(base64Decode(resImg)).image;
      result = "الدقة: ${resText.toString()}";
    });
  }

  dynamic save() async {
    final boundary = key.currentContext
        ?.findRenderObject() as RenderRepaintBoundary?;
    final image = await boundary?.toImage();
    final byteData = await image?.toByteData(format: ImageByteFormat.png);
    final imageBytes = byteData?.buffer.asUint8List();
    if (imageBytes != null) {
      return imageBytes;
    }
  }

  Widget saveButton() {
    return GestureDetector(
      onTap: takeScreenState,
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