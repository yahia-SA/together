import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class defaultTextButton extends StatelessWidget {
  final Function() press;
  final String text;
  const defaultTextButton({Key? key, required this.press, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(color: Colors.black54, fontSize: 10.sp),
      ),
    );
  }
}

class defaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final String? hint;
  final VoidCallback? onTap;
  final bool isPassword;
  final String? Function(String?)? validate;
  final IconData? suffix;
  final VoidCallback? suffixPressed;
  final bool isClickable;

  const defaultFormField({
    required this.controller,
    Key? key,
    required this.type,
    this.onSubmit,
    this.onChange,
    this.hint,
    this.onTap,
    this.validate,
    this.suffix,
    this.suffixPressed,
    this.isPassword = false,
    this.isClickable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
      ),
    );
  }
}
