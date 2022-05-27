import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:game/helpers/colors.dart';
import 'package:game/widgets/Button.dart';
import 'package:game/widgets/Field.dart';

import 'home.dart';
import 'login.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/images/signUp.png', fit: BoxFit.cover),
            ),
            Center(
                child: Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.SIGN_UP_COLOR, Colors.white]),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.fromLTRB(0, 160, 0, 0),
              height: 500,
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
                            hintText: 'الاسم',
                            prefixIcon: Icon(Icons.perm_identity_outlined)),
                      ),
                      TextFormField(

                        textAlign: TextAlign.right,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: AppColors.FIELDS_COLOR,
                            hintText: 'تاريخ الميلاد',
                            prefixIcon: Icon(Icons.date_range_outlined)),
                      ),
                      TextFormField(
                        textAlign: TextAlign.right,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: AppColors.FIELDS_COLOR,
                            hintText: 'البلد',
                            prefixIcon: Icon(Icons.location_on_outlined)),
                      ),
                      TextFormField(
                        textAlign: TextAlign.right,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: AppColors.FIELDS_COLOR,
                            hintText: 'البريد الإلكتروني',
                            prefixIcon: Icon(Icons.email_outlined)),
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
                            text: "تسجيل الحساب",
                            textColor: Colors.white,
                            buttonColor: AppColors.BUTTON_COLOR,
                            action: Home(),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'لديك حساب ؟',
                                style: const TextStyle(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login())),
                              )
                            ]),
                          )
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
