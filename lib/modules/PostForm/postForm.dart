// ignore_for_file: avoid_print, file_names, must_be_immutable

import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/modules/Timeline/HomePage/HomePage.dart';
import 'package:together/modules/Timeline/HomePage/cubit/home_cubit.dart';
import 'package:together/modules/Timeline/HomePage/cubit/home_state.dart';
import 'package:together/shared/components/SignOut.dart';
import 'package:together/shared/components/date.dart';

import '../../shared/components/HaveAccount.dart';
import '../../shared/components/shared_data.dart';

class PostForm extends StatelessWidget {
  PostForm({Key? key}) : super(key: key);

  // Default Radio Button Selected Item When App Starts.
  // Group Value for Radio Button.
  var formkey = GlobalKey<FormState>();
  var name = TextEditingController();
  var duration = TextEditingController();
  var price = TextEditingController();
  var description = TextEditingController();
  var type = TextEditingController();
  String? category, city;
  File? image;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) async {
          if (state is PostformSuccessState) {
            showToast(
                text: state.postmodel.status!, state: ToastStates.SUCCESS);
            Future.delayed(
              const Duration(milliseconds: 500),
              () => HomeCubit.get(context).getHomeData(),
            );
            goToHome(context, const Home());
          }
          if (state is PostformErrorState) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          image = HomeCubit.get(context).image;
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            body: Container(
              decoration: BoxDecoration(gradient: postformbackground),
              child: Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40.h),
                          child: const Center(
                            child: AutoSizeText(
                              'POST!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(textColor),
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(15.r),
                            width: double.infinity.h,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignmentaceAround,
                                children: [
                                  //Giveaway or Lend
                                  const AutoSizeText(
                                    'Categories',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RadioListTile(
                                          title: const AutoSizeText(
                                            'Giveaway',
                                            style: TextStyle(
                                              fontSize: 17.0,
                                            ),
                                          ),
                                          value: 'Giveaway',
                                          groupValue:
                                              HomeCubit.get(context).type,
                                          onChanged: (val) {
                                            HomeCubit.get(context)
                                                .change(val as String?);
                                            type.text =
                                                HomeCubit.get(context).type!;
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                          title: const AutoSizeText(
                                            'Lend',
                                            style: TextStyle(fontSize: 17.0),
                                          ),
                                          value: 'Lend',
                                          groupValue:
                                              HomeCubit.get(context).type,
                                          onChanged: (val) {
                                            HomeCubit.get(context)
                                                .change(val as String?);
                                            type.text =
                                                HomeCubit.get(context).type!;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  //City
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  const AutoSizeText(
                                    'City',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Container(
                                    height: 28.h,
                                    width: 110.w,
                                    margin:
                                        EdgeInsets.only(top: 10.h, left: 5.h),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            spreadRadius: 2.r,
                                            blurRadius: 8.r,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(30.r)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        hint: city == null
                                            ? const AutoSizeText(
                                                '     Select City',
                                                style: TextStyle(
                                                  color: Color(textColor),
                                                ),
                                              )
                                            : AutoSizeText(
                                                '     ' + city!,
                                                style: const TextStyle(
                                                    color: Color(textColor),
                                                    fontSize: 12),
                                              ),
                                        iconSize: 30.0,
                                        style: const TextStyle(
                                            color: Color(textColor),
                                            fontSize: 12),
                                        items: allCities.map(
                                          (val) {
                                            return DropdownMenuItem<String>(
                                              value: val,
                                              child: AutoSizeText(val),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (val) {
                                          HomeCubit.get(context)
                                              .citydata(val.toString());
                                          city = HomeCubit.get(context).city;
                                          print(HomeCubit.get(context).city);
                                        },
                                      ),
                                    ),
                                  ),

                                  //name
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  const AutoSizeText(
                                    'name',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 250.w,
                                    height: 40.h,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter your name"),
                                      controller: name,
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "please enter your name";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),

                                  //Item Picture

                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      const AutoSizeText(
                                        'Item Picture',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5.h),
                                        child: BoxDec(
                                          height: 28,
                                          width: 110,
                                          font: 12,
                                          press: () {
                                            HomeCubit.get(context)
                                                .imagePicker();
                                          },
                                          text: "Choose Pic",
                                          icon: Icons.upload_sharp,
                                          radius: 30,
                                        ),
                                      ),

                                      //Categories
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      const AutoSizeText(
                                        'Categories',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Container(
                                        height: 28.h,
                                        width: 110.w,
                                        margin: EdgeInsets.only(
                                            top: 10.h, left: 5.h),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.4),
                                                spreadRadius: 2.r,
                                                blurRadius: 8.r,
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(30.r)),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            hint: category == null
                                                ? const AutoSizeText(
                                                    '  Select Categorie',
                                                    style: TextStyle(
                                                      color: Color(textColor),
                                                    ),
                                                  )
                                                : AutoSizeText(
                                                    '  ' + category!,
                                                    style: const TextStyle(
                                                        color: Color(textColor),
                                                        fontSize: 12),
                                                  ),
                                            iconSize: 12.0.r,
                                            style: const TextStyle(
                                                color: Color(textColor),
                                                fontSize: 12),
                                            items: allCategories.map(
                                              (val) {
                                                return DropdownMenuItem<String>(
                                                  value: val,
                                                  child: AutoSizeText(val),
                                                );
                                              },
                                            ).toList(),
                                            onChanged: (val) {
                                              HomeCubit.get(context)
                                                  .itemCategorydata(
                                                      val.toString());
                                              category = HomeCubit.get(context)
                                                  .itemCategory;
                                              print(HomeCubit.get(context)
                                                  .itemCategory);
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ), //description
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  const AutoSizeText(
                                    'description',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 250.w,
                                    height: 40.h,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter your name"),
                                      controller: description,
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "please write description";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),

                                  //Possible borrowing time
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  const AutoSizeText(
                                    'Possible borrowing time',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 250.w,
                                    height: 40.h,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                          hintText: "possible borrowing time"),
                                      controller: duration,
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Possible borrowing time";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),

                                  //price if exists
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  const AutoSizeText(
                                    'price',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 250.w,
                                    height: 40.h,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                          hintText: "price if exists"),
                                      controller: price,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),

                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(20.r),
                                    child: Center(
                                      child: state is! PostformLoading
                                          ? BoxDec(
                                              text: 'SHARE',
                                              font: 15,
                                              height: 40,
                                              width: 250,
                                              radius: 30,
                                              press: () {
                                                print(
                                                    "\n${name.text}\n${duration.text}\n${price.text}\n${city!}\n${type.text}\n${description.text}\n${category!}\n${image!.path}\n$iduser\n$token");
                                                if (formkey.currentState!
                                                    .validate()) {
                                                  HomeCubit.get(context)
                                                      .postform(
                                                    user: iduser!.toString(),
                                                    name: name.text,
                                                    duration: duration.text,
                                                    price: price.text,
                                                    city: city!,
                                                    type: type.text,
                                                    description:
                                                        description.text,
                                                    category: category!,
                                                    imageCover: image,
                                                  );
                                                }
                                              },
                                            )
                                          : const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
