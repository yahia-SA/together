import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextButton extends StatelessWidget {
  final Function() press;
  final String text;
  const DefaultTextButton({Key? key, required this.press, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: AutoSizeText(
        text,
        style: const TextStyle(color: Colors.white70, fontSize: 15),
      ),
    );
  }
}

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final String? hint;
  final VoidCallback? onTap;
  final bool isPassword;
  final String? Function(String?)? validate;
  final IconData? suffix;
  final IconData? prefix;
  final VoidCallback? suffixPressed;
  final bool isClickable;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;

  const DefaultFormField({
    required this.controller,
    Key? key,
    required this.type,
    this.onSubmit,
    this.onChange,
    this.hint,
    this.onTap,
    this.validate,
    this.suffix,
    this.prefix,
    this.suffixPressed,
    this.isPassword = false,
    this.isClickable = true,
    this.maxLength,
    this.maxLengthEnforcement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      style: const TextStyle(color: Colors.white70),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: prefix != null ? Icon(prefix) : null,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}
