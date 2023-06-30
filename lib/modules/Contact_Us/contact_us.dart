// ignore_for_file: must_be_immutable, avoid_print

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:together/modules/Contact_Us/cubit/contact_us_cubit.dart';
import 'package:together/shared/components/date.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({Key? key}) : super(key: key);
  var name = TextEditingController();
  var email = TextEditingController();
  var message = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsCubit(),
      child: BlocConsumer<ContactUsCubit, ContactUsState>(
        listener: (context, state) {
          if (state is ContactUsErrorState) {
            print(state.error);
            showToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
          if (state is ContactUsSuccessState) {
            print(state.loginModel.message);
            showToast(
              text: state.loginModel.message!,
              state: ToastStates.SUCCESS,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black), // 1
            ),
            body: Container(
              width: double.infinity.w,
              height: double.infinity.h,
              decoration: const BoxDecoration(
                gradient:
                    LinearGradient(begin: Alignment.bottomCenter, colors: [
                  Color(0xffD8BFD8),
                  Color(0xffFFB6C1),
                  Color(0xffF8C8DC),
                ]),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 70.h, left: 15.h, right: 15.h),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      //maps
                      Container(
                        padding: EdgeInsets.all(5.h),
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        ),
                        width: 400.w,
                        height: 400.h,
                        child:  ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r),
                          ),
                          child: const GoogleMap(
                            mapType: MapType.normal,
                              initialCameraPosition: CameraPosition(
                                target: LatLng(30.5965, 32.2715),
                                zoom: 12,
                              ),
                            ),
                        ),
                      ),

                      SizedBox(
                        height: 30.h,
                      ),
                      //call
                      Container(
                        width: 400.w,
                        padding: EdgeInsets.all(20.r),
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        ),
                        child: Column(
                          children: [
                            const AutoSizeText(
                              'PHONE',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20.w,
                                ),
                                //icon
                                CircleAvatar(
                                  backgroundColor: Colors.deepPurple,
                                  radius: 25,
                                  child: IconButton(
                                    //padding: EdgeInsets.zero,
                                    icon: const Icon(Icons.call),
                                    color: Colors.white,
                                    onPressed: () {
                                      launchUrl(Uri.parse("tel://01098938226"));
                                    },
                                  ),
                                ),

                                SizedBox(
                                  width: 10.w,
                                ),

                                //number textbutton
                                TextButton(
                                    onPressed: () {
                                      launchUrl(Uri.parse("tel://01098938226"));
                                    },
                                    child: const AutoSizeText(
                                      '01098938226',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.deepPurple,
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 30.h,
                      ),

                      //white area
                      Container(
                        width: 400.w,
                        //height: 600.h,
                        padding: EdgeInsets.all(20.h),
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        ),

                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              const AutoSizeText(
                                'CONTACT US',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              const Row(
                                children: [
                                  AutoSizeText(
                                    'Say',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  AutoSizeText(
                                    ' Hello',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              const AutoSizeText(
                                'IF you need something or there is a problem,'
                                'please contact us',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),

                              //full name
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(203, 195, 227, 0.8),
                                      offset: Offset(0, 10),
                                      blurRadius: 20,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(10.h, 5.h, 10.h, 5.h),
                                  child: TextFormField(
                                    controller: name,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your Name';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Full Name',
                                      border: InputBorder.none,
                                    ),
                                    keyboardType: TextInputType.name,
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 40.h,
                              ),

                              //email
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(203, 195, 227, 0.8),
                                      offset: Offset(0, 10),
                                      blurRadius: 20,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(10.h, 5.h, 10.h, 5.h),
                                  child: TextFormField(
                                    controller: email,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                              .hasMatch(value)) {
                                        return "please enter validate email address";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Your Email',
                                      border: InputBorder.none,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 40.h,
                              ),

                              //message
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(203, 195, 227, 0.8),
                                      offset: Offset(0, 10),
                                      blurRadius: 20,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(10.h, 5.h, 10.h, 5.h),
                                  child: TextFormField(
                                    controller: message,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your message';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Your Message',
                                      border: InputBorder.none,
                                    ),
                                    keyboardType: TextInputType.text,
                                    maxLines: 8,
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 20.h,
                              ),

                              state is ContactUsLoadingState?
                               const Center(
                                  child: CircularProgressIndicator())
                              :Container(
                                padding: EdgeInsets.all(3.r),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: OutlinedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      ContactUsCubit.get(context)
                                          .contactUsmessage(
                                              name: name.text,
                                              email: email.text,
                                              message: message.text);
                                    }
                                  },
                                  style: ButtonStyle(
                                      side: MaterialStateProperty.all(
                                          const BorderSide(
                                              style: BorderStyle.none))),
                                  child: const AutoSizeText(
                                    'Send',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 40.h,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.deepPurple,
                            radius: 25,
                            child: IconButton(
                              //padding: EdgeInsets.zero,
                              icon: const Icon(Icons.facebook),
                              color: Colors.white,
                              onPressed: () {
                                launchUrl(
                                    Uri.parse('https://www.facebook.com/'));
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.deepPurple,
                            radius: 25,
                            child: IconButton(
                              //padding: EdgeInsets.zero,
                              icon: const Icon(Icons.email),
                              color: Colors.white,
                              onPressed: () {
                                launchUrl(
                                    Uri.parse("mailto:yomnakerir@gmail.com"));
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.deepPurple,
                            radius: 25,
                            child: IconButton(
                              //padding: EdgeInsets.zero,
                              icon: const Icon(Icons.call),
                              color: Colors.white,
                              onPressed: () {
                                launchUrl(Uri.parse("tel://01098938226"));
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.deepPurple,
                            radius: 25,
                            child: IconButton(
                              //padding: EdgeInsets.zero,
                              icon: const Icon(Icons.location_on),
                              color: Colors.white,
                              onPressed: () {
                                launchUrl(Uri.parse(
                                    "https://www.google.com/maps/dir/30.4196468,31.5619203/suez+canal+university/@30.4303804,31.3553032,9z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x14f8597f201556e7:0x9bd6053867337ff3!2m2!1d32.269729!2d30.620533"));
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
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
