// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/components/shared_data.dart';

class HaveAccount extends StatelessWidget {
  final bool login;
  final Function() prees;

  const HaveAccount({
    Key? key,
    this.login = true,
    required this.prees,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an account?" : "Aleardy have an account?",
          style: TextStyle(fontSize: 10.sp),
        ),
        Container(
          alignment: Alignment.bottomRight,
          child: TextButton(
            child: Text(login ? 'Sign UP' : "Login",
                style: TextStyle(color: Colors.black54, fontSize: 10.sp)),
            onPressed: prees,
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class BoxDec extends StatelessWidget {
  final double height;
  final double width;
  final double font;
  final Function() press;
  final String text;
  final double radius;
  IconData? icon;
  Color? color;
  BoxDec({
    Key? key,
    required this.height,
    required this.width,
    required this.font,
    required this.press,
    required this.text,
    this.icon,
    this.color =Colors.white, required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff528ffe),
              Color(textColor),
            ],
          ),
          borderRadius: BorderRadius.circular(radius.r)),
      child:
       MaterialButton(
        onPressed: press,
        child:
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: text,
              style: TextStyle(
                color: color,
                fontSize: font.sp,
              ),
            ),
            WidgetSpan(child: Icon(icon,size: font.sp,color: color,)),
          ]),
        ),
      ),
    );
  }
}
