// ignore_for_file: non_constant_identifier_names, file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:together/modules/Profile/ProfileScreen.dart';
import 'package:together/modules/Timeline/FAQ/FAQ.dart';
import 'package:together/modules/Timeline/HomePage/Drawer/cubit/cubit.dart';
import 'package:together/modules/Timeline/HomePage/Drawer/cubit/states.dart';
import 'package:together/modules/info/info.dart';
import 'package:together/shared/components/date.dart';
import 'package:together/shared/components/shared_data.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DrawerCubit(),
      child: BlocConsumer<DrawerCubit, DrawerStates>(
          listener: (context, state) => {},
          builder: ((context, state) => Drawer(
                backgroundColor: const Color(0xFF1e1f25),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DrawerHeader(
                        decoration:
                            const BoxDecoration(color: Color(0xFF2d2e39)),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12.h, 5.h, 12.h, 13.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AutoSizeText(
                                'Search',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0.r),
                                  color: const Color(0xFF4c489d),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.close,
                                      color: Colors.white),
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
                                        DrawerCubit.get(context)
                                            .change(value as String?);
                                      },
                                      groupValue:
                                          DrawerCubit.get(context).chosenName,
                                      value: 'Giveaway',
                                      title: const AutoSizeText(
                                        'Giveaway',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      activeColor: const Color(0xFF4c489d),
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      onChanged: (value) {
                                        DrawerCubit.get(context)
                                            .change(value as String?);
                                      },
                                      groupValue:
                                          DrawerCubit.get(context).chosenName,
                                      value: 'Lend',
                                      title: const AutoSizeText(
                                        'Lend',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      activeColor: const Color(0xFF4c489d),
                                    ),
                                  )
                                ],
                              ),
                              MultiSelectDialogField(
                                items: allCategories
                                    .map((item) => MultiSelectItem(item, item))
                                    .toList(),
                                onConfirm: (Values) {
                                  DrawerCubit.get(context)
                                      .categoryselectedItems = Values;
                                  if (kDebugMode) {}
                                },
                                initialValue: const [],
                                chipDisplay: MultiSelectChipDisplay(
                                  onTap: (item) =>
                                      DrawerCubit.get(context).itemChange(item),
                                ),
                                buttonIcon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                ),
                                buttonText: Text(
                                  'Category',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15.r),
                                ),
                                selectedColor: const Color(0xFF4c489d),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              MultiSelectDialogField(
                                items: allCities
                                    .map((item) => MultiSelectItem(item, item))
                                    .toList(),
                                onConfirm: (Values) {
                                  DrawerCubit.get(context).cityselectedItems =
                                      Values;
                                },
                                initialValue: const [],
                                chipDisplay: MultiSelectChipDisplay(
                                  onTap: (item) =>
                                      DrawerCubit.get(context).cityChange(item),
                                ),
                                buttonIcon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                ),
                                buttonText: Text(
                                  'City',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15.r),
                                ),
                                selectedColor: const Color(0xFF4c489d),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(8.r),
                                  margin:
                                      EdgeInsets.only(left: 200.h, top: 40.h),
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
                                  width: 200.r,
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
                          navgigtor(context, InfoScreen());
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
                          Navigator.pop(context);
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
              ))),
    );
  }
}
