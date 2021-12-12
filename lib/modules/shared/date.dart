


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:together/modules/Login_Sign%20up_screen/Loginscreen.dart';

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
      descriptionPadding: EdgeInsets.all(10.r).copyWith(bottom: 0),
      imagePadding: EdgeInsets.all(10.r),
      pageColor: Colors.white,
    );
void goToHome(context) => Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) =>LoginScreen() ),
    );


 RichText nextbutton(String name,{required IconData icon}) => RichText(
  text:  TextSpan(
    children: [TextSpan(
      text: name,
      style:  TextStyle(
          color: const Color(0xffb64dfa),
          fontSize: (22.sp),
          fontWeight: FontWeight.bold,
        ),
    ),
     WidgetSpan(
        child: Icon(
        icon,
        color: const Color(0xffb64dfa),
        size: 22.r,
      ),)]
  ));
    DotsDecorator getDotDecoration() => DotsDecorator(
        color: Colors.blue,
        activeColor:const Color(0xffb64dfa),
        size: Size(10.w, 10.h),
        activeSize: Size(30.w, 10.h),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.h),
        ),
      );
