// ignore_for_file: avoid_print, file_names, must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/modules/PostForm/cubit/postform_cubit.dart';
import 'package:together/shared/components/date.dart';

import '../../shared/components/HaveAccount.dart';
import '../../shared/components/shared_data.dart';
class PostForm extends StatelessWidget {
  PostForm({Key? key}) : super(key: key);

  // Default Radio Button Selected Item When App Starts.
  // Group Value for Radio Button.
  var address = TextEditingController();
  var description = TextEditingController();
  var possibleTime = TextEditingController();
  var salary = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostformCubit(),
      child: BlocConsumer<PostformCubit, PostformState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      iconTheme: const IconThemeData(color: Colors.black),
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: postformbackground),
              child: Padding(
                padding:  EdgeInsets.all(8.0.r),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
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
                                            PostformCubit.get(context).chosenName,
                                        onChanged: (val) {
                                          PostformCubit.get(context)
                                              .change(val as String?);
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
                                            PostformCubit.get(context).chosenName,
                                        onChanged: (val) {
                                          PostformCubit.get(context)
                                              .change(val as String?);
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
                                  width: 110.h,
                                  margin: EdgeInsets.only(top: 10.h, left: 5.h),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 2.r,
                                          blurRadius: 8.r,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(30.r)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: PostformCubit.get(context).city == null
                                          ? const AutoSizeText(
                                              '     Select City',
                                              style: TextStyle(
                                                color: Color(textColor),
                                              ),
                                            )
                                          : AutoSizeText(
                                              '     ' +
                                                  PostformCubit.get(context).city!,
                                              style: const TextStyle(
                                                  color: Color(textColor),
                                                  fontSize: 12),
                                            ),
                                      iconSize: 30.0,
                                      style: const TextStyle(
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
                                        PostformCubit.get(context)
                                            .citydata(val.toString());
                                        print(PostformCubit.get(context).city);
                                      },
                                    ),
                                  ),
                                ),

                                //address
                                SizedBox(
                                  height: 20.h,
                                ),
                                const AutoSizeText(
                                  'address',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 250.h,
                                  height: 40.h,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: "Enter your address"),
                                    controller: address,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "please enter your address";
                                      }
                                      return null;
                                    },
                                  ),
                                ),

                                //Item Picture

                                PostformCubit.get(context).chosenName != 'Giveaway'
                                    ? SizedBox(
                                        height: 20.h,
                                      )
                                    : Column(
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
                                              press: () {},
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
                                            width: 110.h,
                                            margin:
                                                EdgeInsets.only(top: 10.h, left: 5.h),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        Colors.grey.withOpacity(0.4),
                                                    spreadRadius: 2.r,
                                                    blurRadius: 8.r,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(30.r)),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                hint: PostformCubit.get(context)
                                                            .itemCategory ==
                                                        null
                                                    ? const AutoSizeText(
                                                        '  Select Categorie',
                                                        style: TextStyle(
                                                          color: Color(textColor),
                                                        ),
                                                      )
                                                    : AutoSizeText(
                                                        '  ' +
                                                            PostformCubit.get(context)
                                                                .itemCategory!,
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
                                                  PostformCubit.get(context)
                                                      .itemCategorydata(
                                                          val.toString());
                                                  print(PostformCubit.get(context)
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
                                  width: 250.h,
                                  height: 40.h,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: "Enter your address"),
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
                                  width: 250.h,
                                  height: 40.h,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: "possible borrowing time"),
                                    controller: possibleTime,
                                    keyboardType: TextInputType.datetime,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter Possible borrowing time";
                                      }
                                      return null;
                                    },
                                  ),
                                ),

                                //salary if exists
                                SizedBox(
                                  height: 20.h,
                                ),
                                const AutoSizeText(
                                  'salary',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 250.h,
                                  height: 40.h,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: "salary if exists"),
                                    controller: salary,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),

                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  margin: EdgeInsets.all(20.r),
                                  child: Center(
                                    child: BoxDec(
                                      text: 'SHARE',
                                      font: 15,
                                      height: 40,
                                      width: 250,
                                      radius: 30,
                                      press: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content:
                                                AutoSizeText('Posted Succesfuly'),
                                            duration: Duration(milliseconds: 600),
                                          ),
                                        );
                                        print(PostformCubit.get(context).chosenName);
                                        print(PostformCubit.get(context).city);
                                        print(
                                            PostformCubit.get(context).itemCategory);
                                        print(address.text);
                                        print(description.text);
                                        print(possibleTime.text);
                                        print(salary.text);
                                        Navigator.pop(context);
                                      },
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
          );
        },
      ),
    );
  }
}
