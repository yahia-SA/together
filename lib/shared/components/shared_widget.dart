// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
class BorrowCard extends StatelessWidget {
  BorrowCard({Key? key, 
    this.imagePath='https://camerashop.com.eg/wp-content/uploads/2021/02/Canon-5D-IV.png',
    this.description='donnez un coup de pouce à votre photographie, grâce à un reflex numérique sophistiqué et facile d\'utilisation. ',
    this.category='Electerics',
    this.duration='forever',
    this.price='${50} \$',
  }) : super(key: key);
  var imagePath,description,category,duration,price;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.h,
      height: 350.h,
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.only(topRight: Radius.circular(30.r),topLeft:Radius.circular(30.r) ),
        boxShadow: [
          BoxShadow(
              blurRadius: 10.r,
              color: Colors.black.withOpacity(0.5)
          ),

        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xff810072),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(100),)
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60.h,
                      child: AutoSizeText(description,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AutoSizeText(
                          'Category:',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white
                          ),
                        ),
                        AutoSizeText(category,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AutoSizeText(
                          'Duration:',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white
                          ),
                        ),
                        AutoSizeText(duration,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h,),
                    Row(
                      children: [
                        Expanded(child: AutoSizeText(price,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),

                        MaterialButton(
                          onPressed: (){},
                          color: const Color(0xff763aa6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: const AutoSizeText(
                            'Borrow Now',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                        ),


                        Expanded(
                          child: MaterialButton(
                            shape: const CircleBorder(),
                            color: const Color(0xff763aa6),
                            onPressed: () {},
                            child: const Icon(
                              Icons.remove_circle,
                              color: Colors.white,
                            ),
                          ),
                        )

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GiveawayCard extends StatelessWidget {
  GiveawayCard({Key? key, 
    this.itemName = 'camera',
    this.description='donnez un coup de pouce à votre photographie, grâce à un reflex numérique sophistiqué et facile d\'utilisation. ',
    this.category='Electerics',
    this.duration='forever',
    this.price='${50} \$',
  }) : super(key: key);
  String itemName,description,category,duration,price;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.h,
      height: 350.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(30.r),topLeft:Radius.circular(30.r) ),
        color: Colors.blueGrey[50],
        boxShadow: [
          BoxShadow(
              blurRadius: 10.r,
              color: Colors.black.withOpacity(0.5)
          )
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h,),
                  AutoSizeText(itemName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xff5d009a),
                    ),),
                  SizedBox(height: 10.h,),
                  SizedBox(
                    height: 60.h,
                    child: AutoSizeText(description,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: const TextStyle(
                        color: Color(0xff5d009a),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xff5d009a),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(100),)
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 70.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AutoSizeText(
                          'Category:',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white
                          ),
                        ),
                        AutoSizeText(category,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AutoSizeText(
                          'Duration:',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white
                          ),
                        ),
                        AutoSizeText(duration,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h,),
                    Row(
                      children: [
                        Expanded(child: AutoSizeText(price,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),

                        MaterialButton(
                          onPressed: (){},
                          color: const Color(0xff763aa6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: const AutoSizeText(
                            'Borrow Now',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                        ),


                        Expanded(
                          child: MaterialButton(
                            shape: const CircleBorder(),
                            color: const Color(0xff763aa6),
                            onPressed: () {},
                            child: const Icon(
                              Icons.remove_circle,
                              color: Colors.white,
                            ),
                          ),
                        )

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}