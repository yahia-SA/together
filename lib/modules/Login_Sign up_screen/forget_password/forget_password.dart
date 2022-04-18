import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:together/shared/components/HaveAccount.dart';
import 'package:together/shared/components/shared_widget.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({Key? key}) : super(key: key);
   var emailC = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black), // 1
      ),

      body: Stack(
        children: [
          SvgPicture.asset('assets/images/bg000.svg' , width: double.infinity.h,height: double.infinity.h,fit: BoxFit.cover,),
          SizedBox(
            width: double.infinity.h,
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.all(20.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                    width: double.infinity.h,
                    height: 300.h,
                    child: Lottie.asset('assets/images/passwordffs.json'),
                  ),
                   AutoSizeText(
                    'Send Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 250.h,
                    height: 40.h,
                    child: DefaultFormField(
                          controller: emailC,
                          type: TextInputType.emailAddress,
                          hint: "Enter your email")
                  ),
                  SizedBox(height: 20.h,),
                  Center(
                    child:  BoxDec(height: 50,width: 120,radius: 30,text: "Send",font: 15, press: () {  })
                    // Container(
                    //   height: 50.h,
                    //   width: 120.w,
                    //   decoration: BoxDecoration(
                    //       gradient: const LinearGradient(
                    //         begin: Alignment.topCenter,
                    //         end: Alignment.bottomCenter,
                    //         colors: [
                    //           Color(0xff528ffe),
                    //           Color(textColor),
                    //         ],
                    //       ),
                    //       borderRadius: BorderRadius.circular(30.r)),
                    //   child: MaterialButton(
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(30.r),
                    //     ),
                    //     onPressed: () {
                    //       print(emailC.text);
                    //     },
                    //     child:  AutoSizeText(
                    //       'Send',
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 15,
                    //       ),
                    //     ),
                    //   ),
                    // ),
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