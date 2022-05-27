import 'package:flutter/material.dart';
import '/helpers/colors.dart';

// Create a Form widget.
class Field extends StatefulWidget {
  String firstIconName = 'a';
  String hintText = 'Email';
  bool isPassword = false;

  Field(
      {Key? key,
      required this.firstIconName,
      required this.hintText,
      required this.isPassword})
      : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState(
        this.firstIconName, this.hintText, this.isPassword);
  }
}

// Create a corresponding State class.
// This class holds data related to the form.

class MyCustomFormState extends State<Field> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  Color color = Colors.grey;

  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  final _formKey = GlobalKey<FormState>();

  String firstIconName = 'a';
  String hintText = 'Email';
  bool isPassword = false;

  MyCustomFormState(this.firstIconName, this.hintText, this.isPassword);

  @override
  void initState() {
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(
            () => color = node.hasFocus ? AppColors.MAIN_COLOR : Colors.grey);
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Theme(
              data: Theme.of(context).copyWith(
                primaryColor: AppColors.MAIN_COLOR,
              ),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextFormField(
                          focusNode: _focusNodes[0],
                          style: TextStyle(color: color),
                          cursorColor: AppColors.MAIN_COLOR,
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 40),
                            hintText: hintText,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
