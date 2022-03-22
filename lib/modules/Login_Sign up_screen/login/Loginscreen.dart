// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/layout/home.dart';
import 'package:together/modules/Login_Sign%20up_screen/Signup/SignUp_Screen.dart';
import 'package:together/modules/Login_Sign%20up_screen/forget_password/forget_password.dart';
import 'package:together/modules/Login_Sign%20up_screen/login/cubit/states.dart';
import 'package:together/shared/components/HaveAccount.dart';
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
            if (state.loginModel.status) {
              if (kDebugMode) {
                print(state.loginModel.message);
              }
              if (kDebugMode) {
                print(state.loginModel.data.token);
              }

              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data.token,
              ).then((value) {
                goToHome(
                  context,
                  const Home(),
                );
              });
            } else {
              if (kDebugMode) {
                print(state.loginModel.message);
              }

              showToast(
                text: state.loginModel.message,
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
              key: formKey,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/images/bg00.svg',
                    width: double.infinity.w,
                    height: double.infinity.h,
                    fit: BoxFit.cover,
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(height: 20.h),
                          SizedBox(
                              width: double.infinity.w,
                              height: 100.h,
                              child: Image.asset('assets/images/logowtext.png')),
                          SizedBox(
                            height: 100.h,
                          ),
                          const AutoSizeText(
                            'LogIn',
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
                                    if (value!.isEmpty) {
                                      return 'please enter your email address';
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
                                isPassword: LoginCubit.get(context).isPassword,
                                type: TextInputType.visiblePassword,
                                suffix: LoginCubit.get(context).suffix,
                                onSubmit: (value) {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
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
                                    return 'password is too short';
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForgetPassword()),
                                  );
                                },
                              )),
                          Center(
                            child: ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              builder: (context) => BoxDec(
                                text: 'LOGIN NOW',
                                font: 15,
                                height: 40.h,
                                width: 120.r,
                                radius: 30.r,
                                press: () {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                      email: emailC.text,
                                      password: passwordC.text,
                                    );
                                  }
                                },
                              ),
                              fallback: (context) =>
                                  const Center(child: CircularProgressIndicator()),
                            ),
                          ),
                          HaveAccount(
                            prees: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignUp()),
                              );
                            },
                          ),
                        ],
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
