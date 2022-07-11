// ignore_for_file: non_constant_identifier_names, file_names, avoid_print

import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/modules/About_us/about_us.dart';
import 'package:together/modules/Contact_Us/contact_us.dart';
import 'package:together/modules/Profile/ProfileScreen.dart';
import 'package:together/modules/Timeline/FAQ/FAQ.dart';
import 'package:together/modules/Timeline/HomePage/cubit/home_cubit.dart';
import 'package:together/modules/Timeline/HomePage/cubit/home_state.dart';
import 'package:together/shared/components/date.dart';
import 'package:together/shared/components/shared_data.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child:
          BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) async {
        if (state is DrawerErrorState) {
          print(state.error);
          showToast(
            text: state.error,
            state: ToastStates.ERROR,
          );
        }
        if (state is SearchSuccessState) {
          Navigator.pop(context);
          showToast(text: "success", state: ToastStates.SUCCESS);
        }
      }, builder: ((context, state) {
        return Drawer(
          backgroundColor: const Color(0xFF1e1f25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(color: Color(0xFF2d2e39)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(12.h, 5.h, 12.h, 13.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AutoSizeText(
                          'Search',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0.r),
                            color: const Color(textColor2),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: const Color(0xFF24252d),
                  height: 232.h,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                onChanged: (value) {
                                  HomeCubit.get(context)
                                      .selectType(value as String?);
                                },
                                groupValue: HomeCubit.get(context).chosenName,
                                value: 'Giveaway',
                                title: const AutoSizeText(
                                  'Giveaway',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                                activeColor: const Color(textColor2),
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                onChanged: (value) {
                                  HomeCubit.get(context)
                                      .selectType(value as String?);
                                },
                                groupValue: HomeCubit.get(context).chosenName,
                                value: 'Lend',
                                title: const AutoSizeText(
                                  'Lend',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                                activeColor: const Color(textColor2),
                              ),
                            )
                          ],
                        ),
                        DropdownButtonFormField(
                          style: const TextStyle(color: Color(textColor2)),
                          items: allCategories
                              .map((item) => DropdownMenuItem(
                                  value: item, child: AutoSizeText(item)))
                              .toList(),
                          onChanged: (Values) {
                            HomeCubit.get(context).itemChange(Values);
                          },
                          value: HomeCubit.get(context).categoryselectedItems,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                          hint: AutoSizeText(
                            'Category',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 15.r),
                          ),
                          focusColor: const Color(textColor2),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        DropdownButtonFormField(
                          items: allCities
                              .map((item) => DropdownMenuItem(
                                  value: item, child: AutoSizeText(item)))
                              .toList(),
                          onChanged: (Values) {
                            HomeCubit.get(context).cityChange(Values);
                          },
                          value: HomeCubit.get(context).cityselectedItems,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                          hint: AutoSizeText(
                            'City',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 15.r),
                          ),
                          style: const TextStyle(color: Color(textColor2)),
                        ),
                        InkWell(
                          onTap: () {
                            HomeCubit.get(context).getusersearch(
                              type: HomeCubit.get(context).chosenName,
                              category: HomeCubit.get(context)
                                  .categoryselectedItems
                                  .toString(),
                              city: HomeCubit.get(context)
                                  .cityselectedItems
                                  .toString(),
                            );
                            log(HomeCubit.get(context).chosenName!);
                            log(HomeCubit.get(context).categoryselectedItems!);
                            log(HomeCubit.get(context).cityselectedItems!);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.r),
                            margin: EdgeInsets.only(left: 200.h, top: 40.h),
                            child: AutoSizeText(
                              "Search".toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: const Color(0xff535ba0)),
                            width: 200.w,
                            height: 40.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    navgigtor(context, ProfileScreen());
                  },
                  title: const AutoSizeText(
                    'Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  thickness: 2.0.r,
                  height: 8.0.h,
                  color: const Color(0xFF2d2e39),
                ),
                ListTile(
                  onTap: () {
                    navgigtor(context, const FAQ());
                  },
                  title: const AutoSizeText(
                    'FAQ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  thickness: 2.0.r,
                  height: 8.0.h,
                  color: const Color(0xFF2d2e39),
                ),
                ListTile(
                  onTap: () {
                    navgigtor(context, const AboutScreen());
                  },
                  title: const AutoSizeText(
                    'About Us',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  thickness: 2.0.r,
                  height: 8.0.h,
                  color: const Color(0xFF2d2e39),
                ),
                ListTile(
                  onTap: () {
                    navgigtor(context, ContactScreen());
                  },
                  title: const AutoSizeText(
                    'Contact Us',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  thickness: 2.0.r,
                  height: 8.0.h,
                  color: const Color(0xFF2d2e39),
                ),
              ],
            ),
          ),
        );
      })),
    );
  }
}
