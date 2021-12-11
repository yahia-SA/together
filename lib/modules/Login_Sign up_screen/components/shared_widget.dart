
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
Widget defaultTextButton({
  required Function() prss ,
  required String text,
}) {
  return TextButton(
      onPressed: prss,
      child: Text(
        text,
        style: TextStyle(color: Colors.black54,fontSize: 10.sp),
      ),
    );
}
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChange,
  String? hint,
  VoidCallback? onTap,
  bool isPassword = false,
  String?Function(String?)? validate,
  IconData? suffix,
  VoidCallback ? suffixPressed,
  bool isClickable = true,
}) => TextFormField(
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
