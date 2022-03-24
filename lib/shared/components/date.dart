// ignore_for_file: constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:together/modules/Login_Sign%20up_screen/login/Loginscreen.dart';
import 'package:together/shared/network/local/cache_helper.dart';

final Shader linearGradient = const LinearGradient(
  colors: <Color>[
    Color(0xff528ffe),
    Color(0xffb64dfa),
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

PageDecoration getPageDecoration() => PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          foreground: Paint()..shader = linearGradient),
      bodyTextStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          foreground: Paint()..shader = linearGradient),
      titlePadding: EdgeInsets.all(10.r).copyWith(bottom: 0),
      imagePadding: EdgeInsets.all(10.r),
      pageColor: Colors.white,
    );
void goToHome(context, page) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
void submit(context) {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value)
    {
      if (value) {
        goToHome(context, LoginScreen());
      }
    });
}
// void signOut(context) {
//   CacheHelper.removeData(
//     key: 'token',
//   ).then((value) {
//     if (value) {
//       goToHome(
//         context,
//         LoginScreen(),
//       );
//     }
//   });
// }

// String token = '';

Row nextbutton(String name, {IconData? icon}) => Row(children: [
      AutoSizeText(
        name,
        style: const TextStyle(
          color: Color(0xffb64dfa),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      Icon(icon, color: const Color(0xffb64dfa), size: 22.r),
    ]);
DotsDecorator getDotDecoration() => DotsDecorator(
      color: Colors.blue,
      activeColor: const Color(0xffb64dfa),
      size: Size(10.w, 10.h),
      activeSize: Size(30.w, 10.h),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
    );
void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0.sp,
    );
chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}

enum ToastStates { SUCCESS, ERROR, WARNING }
