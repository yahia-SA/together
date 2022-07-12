// ignore_for_file: file_names, prefer_const_constructors, avoid_print

import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:together/modules/Login_Sign%20up_screen/Signup/cubit/cubit.dart';
import 'package:together/modules/Login_Sign%20up_screen/Signup/cubit/states.dart';
import 'package:together/modules/Login_Sign%20up_screen/login/Loginscreen.dart';
import 'package:together/modules/Timeline/HomePage/HomePage.dart';
import 'package:together/shared/components/HaveAccount.dart';
import 'package:together/shared/components/SignOut.dart';
import 'package:together/shared/components/date.dart';
import 'package:together/shared/components/shared_data.dart';
import 'package:together/shared/components/shared_widget.dart';
import 'package:together/shared/network/local/cache_helper.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var fullname = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var passwordconfirm = TextEditingController();
  var phone = TextEditingController();
  var idnumber = TextEditingController();
  var address = TextEditingController();
  var date = TextEditingController();
  String? city;
  File? profileImage, idImage;

  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SignUpCubit(),
        child:
            BlocConsumer<SignUpCubit, SignUpStates>(listener: (context, state) {
          if (state is SignUpSuccessState) {
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
                  Home(),
                );
              });
            }
          }
          if (state is SignUpErrorState) {
            print(state.error);
            showToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
        }, builder: (context, state) {
          idImage = SignUpCubit.get(context).idImage;
          profileImage = SignUpCubit.get(context).profileImage;
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Stack(
              children: [
                SvgPicture.asset(
                  'assets/images/bg000.svg',
                  width: double.infinity.w,
                  height: double.infinity.h,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: SizedBox(
                    width: double.infinity.w,
                    height: double.infinity.h,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(20.r),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                height: 15.h,
                              ),
                              AutoSizeText(
                                'Sign UP',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              AutoSizeText(
                                'Full name',
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
                                      controller: fullname,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'please enter your Name';
                                        }
                                        return null;
                                      },
                                      type: TextInputType.name,
                                      hint: "Enter your Name")),
                              SizedBox(
                                height: 25.h,
                              ),
                              AutoSizeText(
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
                                      controller: email,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'please enter your email address';
                                        }
                                        return null;
                                      },
                                      type: TextInputType.emailAddress,
                                      hint: "Enter email")),
                              SizedBox(
                                height: 25.h,
                              ),
                              AutoSizeText(
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
                                    isPassword:
                                        SignUpCubit.get(context).isPassword,
                                    suffix: SignUpCubit.get(context).suffix,
                                    suffixPressed: () {
                                      SignUpCubit.get(context)
                                          .changePasswordVisibility();
                                    },
                                    controller: password,
                                    type: TextInputType.visiblePassword,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'password is too short';
                                      }
                                      return null;
                                    },
                                    hint: "Enter password"),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              AutoSizeText(
                                'Confirm Password',
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
                                    isPassword: SignUpCubit.get(context)
                                        .confirmisPassword,
                                    suffix:
                                        SignUpCubit.get(context).confirmsuffix,
                                    suffixPressed: () {
                                      SignUpCubit.get(context)
                                          .changeconfirmPasswordVisibility();
                                    },
                                    controller: passwordconfirm,
                                    type: TextInputType.visiblePassword,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'password is too short';
                                      }
                                      if (value != password.text) {
                                        return 'password not match';
                                      }
                                      return null;
                                    },
                                    hint: "Enter password"),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              AutoSizeText(
                                'Phone number',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              SizedBox(
                                width: 250.w,
                                height: 40.h,
                                child: DefaultFormField(
                                    controller: phone,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your phone number';
                                      }
                                      return null;
                                    },
                                    maxLength: 11,
                                    type: TextInputType.phone,
                                    hint: "Enter your Phone Number"),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              AutoSizeText(
                                'Birth date',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                height: 28.h,
                                width: 110.w,
                                // decoration: BoxDecoration(
                                //     color: Colors.white,
                                //     borderRadius: BorderRadius.circular(30.r)),
                                child: DefaultFormField(
                                  controller: date,
                                  readOnly: true,
                                  hint: 'Pick your Date',
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'please enter your birth date';
                                    }
                                    return null;
                                  },
                                  onTap: () async {
                                    var time = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100));
                                    date.text =
                                        time.toString().substring(0, 10);
                                  },
                                ),
                                // DateTimePicker(
                                //   type: DateTimePickerType.date,
                                //   dateMask: 'yyyy/MMM/d',
                                //   // controller: date,
                                //   decoration: InputDecoration(
                                //     border: InputBorder.none,
                                //   ),
                                //   textAlign: TextAlign.center,
                                //   style: TextStyle(
                                //       fontSize: 15.r, color: Color(textColor)),
                                //   initialValue: DateTime.now().toString(),
                                //   firstDate: DateTime(1900),
                                //   lastDate: DateTime(2100),
                                //   validator: (value) {
                                //     if (value!.isEmpty) {
                                //       return 'please enter your birthday';
                                //     }
                                //     return null;
                                //   },
                                //   onChanged: (val) {
                                //     SignUpCubit.get(context).birthdaydata(val);
                                //     birthday = SignUpCubit.get(context).birthday;
                                //     print("\n${birthday.toString()}\n");
                                //   },
                                //   onSaved: (val) {
                                //     SignUpCubit.get(context).birthdaydata(val);
                                //     birthday = SignUpCubit.get(context).birthday;
                                //     print("\n${birthday.toString()}\n");
                                //   },
                                // ),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              AutoSizeText(
                                'Address',
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
                                      controller: address,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'please enter yor address';
                                        }
                                        return null;
                                      },
                                      type: TextInputType.streetAddress,
                                      hint: "Enter your address")),
                              SizedBox(
                                height: 25.h,
                              ),
                              AutoSizeText(
                                'ID Card Number',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              SizedBox(
                                width: 250.w,
                                height: 40.h,
                                child: DefaultFormField(
                                    controller: idnumber,
                                    maxLength: 14,
                                    type: TextInputType.number,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your Id';
                                      }
                                      return null;
                                    },
                                    hint: "Enter your Id"),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              AutoSizeText(
                                'City',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                height: 28.h,
                                width: 110.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30.r)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: city == null
                                        ? AutoSizeText(
                                            '     Select City',
                                            style: TextStyle(
                                              color: Color(textColor),
                                            ),
                                          )
                                        : AutoSizeText(
                                            '     ${city!}',
                                            style: TextStyle(
                                                color: Color(textColor),
                                                fontSize: 12),
                                          ),
                                    iconSize: 30.0,
                                    style: TextStyle(
                                        color: Color(textColor), fontSize: 12),
                                    items: allCities.map(
                                      (val) {
                                        return DropdownMenuItem<String>(
                                          value: val,
                                          child: AutoSizeText(val),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (val) {
                                      SignUpCubit.get(context)
                                          .citydata(val.toString());
                                      city = SignUpCubit.get(context).city;
                                      print(city);
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Container(
                                  width: double.infinity.w,
                                  height: 5.h,
                                  color: Colors.black.withOpacity(0.15)),
                              SizedBox(
                                height: 10.h,
                              ),
                              AutoSizeText(
                                'Your picture',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              BoxDec(
                                height: 28,
                                width: 110,
                                font: 12,
                                press: () {
                                  SignUpCubit.get(context).profileImagePicker();
                                },
                                text: "Choose Pic",
                                icon: Icons.upload_sharp,
                                radius: 30,
                              ),
                              SizedBox(
                                width: 100.w,
                                height: 100.h,
                                child: profileImage != null
                                    ? Image.file(
                                        profileImage!,
                                        width: 100.w,
                                        height: 100.h,
                                      )
                                    : AutoSizeText(' '),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              AutoSizeText(
                                'Requirements',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle_rounded,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      AutoSizeText(
                                        'No cap , no glasses',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle_rounded,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      AutoSizeText(
                                        'No more than 12 months old',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle_rounded,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      AutoSizeText(
                                        'Face takes 70-80% of it',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Container(
                                  width: double.infinity.w,
                                  height: 5.h,
                                  color: Colors.black.withOpacity(0.15)),
                              SizedBox(
                                height: 10.h,
                              ),
                              AutoSizeText(
                                'ID picture',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              BoxDec(
                                height: 28,
                                width: 110,
                                font: 12,
                                press: () {
                                  SignUpCubit.get(context).iDImagePicker();
                                },
                                text: "Choose Pic",
                                icon: Icons.upload_sharp,
                                radius: 30,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              AutoSizeText(
                                'Requirements',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                width: 200.w,
                                child: idImage != null
                                    ? Image.file(
                                        idImage!,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset('assets/images/id.jpg'),
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              Center(
                                child: state is! SignUpLoadingState?
                                  BoxDec(
                                    font: 15,
                                    height: 40,
                                    width: 120,
                                    text: 'SignUp',
                                    radius: 30,
                                    press: () {
                                      if (formKey.currentState!.validate()) {
                                        print(
                                            "\n$idImage\n\n$profileImage\n\n${date.text}");
                                        SignUpCubit.get(context).userSignUp(
                                          name: fullname.text,
                                          email: email.text,
                                          password: password.text,
                                          passwordconfirm: passwordconfirm.text,
                                          phone: phone.text,
                                          birthday: date.text,
                                          city: city.toString(),
                                          address: address.text,
                                          idnumber: idnumber.text,
                                          yourpicture: profileImage,
                                          idpicture: idImage,
                                        );
                                      }
                                    },
                                  ):Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              HaveAccount(
                                login: false,
                                prees: () {
                                  navgigtor(context, LoginScreen());
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
