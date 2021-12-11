import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:together/components/shared_data.dart';
import 'Signup/SignUp_Screen.dart';
import 'components/HaveAccount.dart';
import 'components/shared_widget.dart';
import 'forget_password.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailC = TextEditingController();
  var passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          padding:  EdgeInsets.all(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 20.h),
              Container(
                width: double.infinity.w,
                height: 200.h,
                child: Lottie.asset('assets/images/main.json'),
              ),
              Text(
                'LogIn',
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
                  child: defaultFormField(
                      controller: emailC,
                      type: TextInputType.emailAddress,
                      hint: "Enter your email")),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: const Color(textColor),
                ),
              ),
              SizedBox(
                width: 250.w,
                height: 40.h,
                child: defaultFormField(
                    controller: passwordC,
                    isPassword: true,
                    type: TextInputType.visiblePassword,
                    hint: 'Enter your password'),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                  alignment: Alignment.bottomRight,
                  child: defaultTextButton(
                    text: 'Forget Password?',
                    prss: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassword()),
                      );
                    },
                  )),
              Center(
                child: BoxDec(font: 15, press: () {  }, height: 40, width: 120,text:'LogIn' ,),
              ),
              HaveAccount(prees: () { Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  SignUp()),
                      ); },),
            ],
          ),
        ),
      ),
    );
  }
}



              