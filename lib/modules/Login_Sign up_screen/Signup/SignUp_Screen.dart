// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/modules/Login_Sign%20up_screen/login/Loginscreen.dart';
import 'package:together/shared/components/HaveAccount.dart';
import 'package:together/shared/components/shared_data.dart';
import 'package:together/shared/components/shared_widget.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  var fullname = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var phone = TextEditingController();
  var idnumber = TextEditingController();

  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0.r),
        child: SizedBox(
          width: double.infinity.w,
          height: double.infinity.h,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Sign UP',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                      color: const Color(textColor),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Fullname',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Color(textColor),
                    ),
                  ),
                  SizedBox(
                      width: 250.w,
                      height: 40.h,
                      child: DefaultFormField(
                          controller: fullname,
                          type: TextInputType.name,
                          hint: "Enter your Name")),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Color(textColor),
                    ),
                  ),
                  SizedBox(
                      width: 250.w,
                      height: 40.h,
                      child: DefaultFormField(
                          controller: email,
                          type: TextInputType.emailAddress,
                          hint: "Enter email")),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Color(textColor),
                    ),
                  ),
                  SizedBox(
                      width: 250.w,
                      height: 40.h,
                      child: DefaultFormField(
                          isPassword: true,
                          suffix: Icons.visibility,
                          suffixPressed: (){},
                          controller: password,
                          type: TextInputType.visiblePassword,
                          hint: "Enter password")),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'phone',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Color(textColor),
                    ),
                  ),
                  SizedBox(
                      width: 250.w,
                      height: 40.h,
                      child: DefaultFormField(
                          controller: phone,
                          type: TextInputType.phone,
                          hint: "Enter your Phone Number")),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'ID Number',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Color(textColor),
                    ),
                  ),
                  SizedBox(
                      width: 250.w,
                      height: 40.h,
                      child: DefaultFormField(
                          controller: idnumber,
                          type: TextInputType.number,
                          hint: "Enter your Id")),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ID Pictuer',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Color(textColor),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      BoxDec(
                        height: 28,
                        width: 110,
                        font: 12,
                        press: () {},
                        text: "Choose Pic",
                        icon: Icons.upload_sharp, radius: 30,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Your Pictuer',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Color(textColor),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      BoxDec(
                        height: 28,
                        width: 110,
                        font: 12,
                        press: () {},
                        text: "Choose Pic",
                        icon: Icons.upload_sharp, radius: 30,
                      )
                    ],
                  ),
                  SizedBox(height: 10.h,),
                Center(
                  child: BoxDec(font: 15, press: () {  }, height: 40, width: 120,text:'SignUp', radius: 30 ,),
                ),
                HaveAccount(login: false,prees: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  LoginScreen()),
                        ); },),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
