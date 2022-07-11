// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/shared/components/shared_data.dart';

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
        AutoSizeText(
          login ? "Don't have an account?" : "Aleardy have an account?",
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
        Container(
          alignment: Alignment.bottomRight,
          child: TextButton(
            child: AutoSizeText(login ? 'Sign UP' : "Login",
                style: const TextStyle(color: Colors.white70, fontSize: 15)),
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
  // Color? color;
  BoxDec({
    Key? key,
    required this.height,
    required this.width,
    required this.font,
    required this.press,
    required this.text,
    this.icon,
    // this.color =Colors.white,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(radius.r)),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.r)),
        onPressed: press,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          AutoSizeText(
            text,
            style: TextStyle(
              color: const Color(textColor),
              fontSize: font,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (icon != null)Icon(icon,size: font.r,color:const Color(textColor) ,)
        ]),
      ),
    );
  }
}
