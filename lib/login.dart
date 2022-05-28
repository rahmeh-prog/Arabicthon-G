import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'mainScreen.dart';
import '/colors.dart';
import '/signUp.dart';
import '/Button.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Expanded(child: Positioned.fill(
              child: Image.asset('images/signUp.png', fit: BoxFit.cover),
            ))
,
            Center(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [AppColors.SIGN_UP_COLOR, Colors.white]),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.fromLTRB(0, 160, 0, 0),
                  height: 350,
                  width: 300,
                  child: Container(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormField(
                            textAlign: TextAlign.right,
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: AppColors.FIELDS_COLOR,
                                hintText: 'البريد الالكتروني',
                                prefixIcon: Icon(Icons.perm_identity_outlined)),
                          ),
                          TextFormField(
                              obscureText: true,
                              textAlign: TextAlign.right,
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.FIELDS_COLOR,
                                  hintText: "كلمة المرور",
                                  prefixIcon: Icon(Icons.lock_outline))),
                          Column(
                            children: [
                              button(
                                text: "تسجيل دخول",
                                textColor: Colors.white,
                                buttonColor: AppColors.BUTTON_COLOR,
                                action: mainScreen(),
                              ),
                            ],
                          )
                        ],
                      )),
                ))
          ],
        ),
      ),
    );
  }
}