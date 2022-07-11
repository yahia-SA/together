// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/modules/Timeline/FAQ/cubit/cubit.dart';
import 'package:together/modules/Timeline/FAQ/cubit/states.dart';
import 'package:together/shared/components/date.dart';
class FAQ extends StatelessWidget {
  const FAQ({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => FAQCubit(),
        child: BlocConsumer<FAQCubit, FAQStates>(
            builder: ((context, state) => Scaffold(
                    extendBodyBehindAppBar: true,
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      iconTheme: const IconThemeData(color: Colors.black),
                    ),
              body: Container(
                    width: double.infinity.w,
                    height: double.infinity.h,
                    decoration: BoxDecoration(
                      gradient: background,
                    ),
                    child: SingleChildScrollView(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 59.h, bottom: 40.h),
                          child:  const AutoSizeText(
                            'FAQ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Colors.transparent,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.0.r),
                            child: ExpansionPanelList(
                              animationDuration: const Duration(seconds: 1),
                              elevation: 0,
                              expansionCallback: (index, isExpanded) {
                                 FAQCubit.get(context).changeVisibility(index);
                              },
                              children: FAQCubit.get(context).items
                                  .map((item) => ExpansionPanel(
                                        backgroundColor: Colors.transparent,
                                        canTapOnHeader: true,
                                        isExpanded: item.isExpanded,
                                        headerBuilder: (context, isExpanded) =>
                                            Container(
                                          padding: EdgeInsets.all(16.r),
                                          margin: EdgeInsets.only(bottom: 16.h),
                                          decoration: BoxDecoration(
                                            
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color(0xff16142e),
                                                Color(0xff211e56),
                                                Color(0xff6c0d6e),
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                          ),
                                          child: ListTile(
                                            title: AutoSizeText(
                                              item.headr,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                        body: Container(
                                          decoration: BoxDecoration(gradient: background),
                                          child: ListTile(
                                            
                                              title: AutoSizeText(
                                            item.body,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                            textAlign: TextAlign.left,
                                          )),
                                        ),
                                      ),
                                    )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
            )),
            listener: (contex, state) {}));
  }
}
