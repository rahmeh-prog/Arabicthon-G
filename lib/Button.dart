
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class button extends StatelessWidget{

  String text='Log In';
  Color textColor=AppColors.MAIN_COLOR;
  Color buttonColor=Colors.white;
  Widget action;

  button(
      {Key? key,
        required this.text,
        required this.textColor,
        required this.buttonColor,
        required this.action
      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: FloatingActionButton(
            heroTag: text,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => action));

            },
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child:  Text(
              text,
              style: TextStyle(color: textColor,fontWeight: FontWeight.bold),

            ),
          ),
        )

      ],
    );

  }

}