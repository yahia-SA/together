// ignore_for_file: must_be_immutable, avoid_print

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:together/modules/Login_Sign%20up_screen/forget_password/cubit/forget_password_cubit.dart';
import 'package:together/shared/components/HaveAccount.dart';
import 'package:together/shared/components/date.dart';
import 'package:together/shared/components/shared_widget.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  var emailC = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordErrorState) {
            print(state.error);
            showToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
          if (state is ForgetPasswordSuccessState) {
            print(state.loginModel.message);
            showToast(
              text: state.loginModel.message!,
              state: ToastStates.SUCCESS,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black), // 1
            ),
            body: Stack(
              children: [
                SvgPicture.asset(
                  'assets/images/bg000.svg',
                  width: double.infinity.w,
                  height: double.infinity.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: double.infinity.w,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(20.r),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50.h,
                            ),
                            SizedBox(
                              width: double.infinity.w,
                              height: 300.h,
                              child: Lottie.asset(
                                  'assets/images/passwordffs.json'),
                            ),
                            const AutoSizeText(
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
                                width: 250.w,
                                height: 40.h,
                                child: DefaultFormField(
                                    controller: emailC,
                                    type: TextInputType.emailAddress,
                                    validate: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                              .hasMatch(value)) {
                                        return "please enter validate email address";
                                      }
                                      return null;
                                    },
                                    hint: "Enter your email")),
                            SizedBox(
                              height: 20.h,
                            ),
                            Center(
                                child: state is ForgetPasswordLoadingState?
                               const Center(
                                  child: CircularProgressIndicator())
                              : BoxDec(
                                  height: 50,
                                  width: 120,
                                  radius: 30,
                                  text: "Send",
                                  font: 15,
                                  press: () {
                                    if (formKey.currentState!.validate()) {
                                      ForgetPasswordCubit.get(context)
                                          .forgetpassword(
                                        email: emailC.text,
                                      );
                                    }
                                  }),
                            )
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
