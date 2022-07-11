// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, avoid_print

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/modules/Login_Sign%20up_screen/Signup/SignUp_Screen.dart';
import 'package:together/modules/Login_Sign%20up_screen/forget_password/forget_password.dart';
import 'package:together/modules/Login_Sign%20up_screen/login/cubit/states.dart';
import 'package:together/modules/Timeline/HomePage/HomePage.dart';
import 'package:together/shared/components/HaveAccount.dart';
import 'package:together/shared/components/SignOut.dart';
import 'package:together/shared/components/date.dart';
import 'package:together/shared/components/shared_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:together/shared/network/local/cache_helper.dart';
import 'cubit/cubit.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  var emailC = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var passwordC = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status == 'success') {
              print(state.loginModel.message);
              print(state.loginModel.token);
              CacheHelper.saveData(
                key: 'iduser',
                value: state.loginModel.data!.user!.sId,
              ).then((value) {
                return iduser = state.loginModel.data!.user!.sId;
              });
              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.token,
              ).then((value) {
                token = state.loginModel.token;
                goToHome(
                  context,
                  const Home(),
                );
              });
            }
          }
          if (state is LoginErrorState) {
            print(state.error);
            showToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/images/bg00.svg',
                    width: double.infinity.w,
                    height: double.infinity.h,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Center(
                      child: SizedBox(
                        width: double.infinity.w,
                        height: double.infinity.h,
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
                                    height: 100.h,
                                    width: double.infinity.w,
                                    child: Image.asset(
                                      'assets/images/logowtext.png',
                                    )),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Expanded(
                                flex: 3,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const AutoSizeText(
                                        'Login',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      const AutoSizeText(
                                        'Email',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
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
                                        height: 10.h,
                                      ),
                                      const AutoSizeText(
                                        'Password',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 250.w,
                                        height: 40.h,
                                        child: DefaultFormField(
                                            controller: passwordC,
                                            isPassword: LoginCubit.get(context)
                                                .isPassword,
                                            type: TextInputType.visiblePassword,
                                            suffix:
                                                LoginCubit.get(context).suffix,
                                            onSubmit: (value) {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                LoginCubit.get(context)
                                                    .userLogin(
                                                  email: emailC.text,
                                                  password: passwordC.text,
                                                );
                                              }
                                            },
                                            suffixPressed: () {
                                              LoginCubit.get(context)
                                                  .changePasswordVisibility();
                                            },
                                            validate: (value) {
                                              if (value!.isEmpty) {
                                                return "password is too short";
                                              }
                                              return null;
                                            },
                                            hint: 'Enter your password'),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Container(
                                          alignment: Alignment.bottomLeft,
                                          child: DefaultTextButton(
                                            text: 'Forget Password?',
                                            press: () {
                                              navgigtor(
                                                  context, ForgetPassword());
                                            },
                                          )),
                                      Center(
                                        child: state is! LoginLoadingState
                                            ? BoxDec(
                                                text: 'LOGIN NOW',
                                                font: 15,
                                                height: 40,
                                                width: 120,
                                                radius: 30,
                                                press: () {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    LoginCubit.get(context)
                                                        .userLogin(
                                                      email: emailC.text,
                                                      password: passwordC.text,
                                                    );
                                                  }
                                                },
                                              )
                                            : const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                      ),
                                      HaveAccount(
                                        prees: () {
                                          navgigtor(context, SignUp());
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
