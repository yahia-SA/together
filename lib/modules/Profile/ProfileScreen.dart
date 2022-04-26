// ignore_for_file: file_names, must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/components/shared_widget.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key, 
     this.username = 'your username',
     this.email = 'your email',
     this.currentPassword = 'your password',
}) : super(key: key);
   String username ;
   String email ;
   String currentPassword;
    TextEditingController newPassword = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity.h,
        height: double.infinity.h,
        decoration: const BoxDecoration(
          color: Color(0xff763aa6),
        ),
        child: Center(
          child: Container(
            width: 310.h,
            height: double.infinity.h,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.r,
                  spreadRadius: 0.r,
                  blurStyle: BlurStyle.outer
                )
              ],
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [

                    Container(
                      margin: EdgeInsets.only(top: 40.h),
                      height: 150.h,
                      width: 120.h,
                      child: Image.network('https://lovebelfast.co.uk/wp-content/uploads/2019/01/38709877_10156590829944304_5565813527219798016_n.jpg',fit: BoxFit.cover,),                    ),
                    SizedBox(height: 10.h,),
                    const AutoSizeText('Mustafa Slama',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: 20.h,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 108.h,
                              height: 30.h,
                              color: const Color(0xff763aa6),
                              child: const Center(
                                child: AutoSizeText(
                                  'SETTINGS',
                                  style: TextStyle(
                                      color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 20.h,),
                          const AutoSizeText(
                            'Username',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff763aa6),
                            ),
                          ),
                          SizedBox(
                            width: 250.h,
                            height: 40.h,
                            child: TextFormField(
                              controller: TextEditingController()..text = username,
                              keyboardType: TextInputType.name,
                            ),
                          ),

                          SizedBox(height: 20.h,),
                          const AutoSizeText(
                            'Email',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff763aa6),
                            ),
                          ),
                          SizedBox(
                            width: 250.h,
                            height: 40.h,
                            child: TextFormField(
                              controller: TextEditingController()..text = email,
                              keyboardType: TextInputType.name,
                            ),
                          ),

                          SizedBox(height: 20.h,),
                          const AutoSizeText(
                            'Current Password',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff763aa6),
                            ),
                          ),
                          SizedBox(
                            width: 250.h,
                            height: 40.h,
                            child: TextFormField(
                              controller: TextEditingController()..text = currentPassword,
                              keyboardType: TextInputType.name,
                            ),
                          ),

                          SizedBox(height: 20.h,),
                          const AutoSizeText(
                            'New Password',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff763aa6),
                            ),
                          ),
                          SizedBox(
                            width: 250.h,
                            height: 40.h,
                            child: TextFormField(
                              controller: newPassword,
                              keyboardType: TextInputType.name,
                            ),
                          ),

                          SizedBox(height: 20.h,),
                          const AutoSizeText(
                            'Confirm password',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff763aa6),
                            ),
                          ),
                          SizedBox(
                            width: 250.h,
                            height: 40.h,
                            child: TextFormField(
                              controller: confirmPassword,
                              keyboardType: TextInputType.name,
                            ),
                          ),

                          SizedBox(height: 20.h,),
                          MaterialButton(
                            onPressed: (){},
                            color: const Color(0xff763aa6),
                            child: const AutoSizeText(
                            'Save Changes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),
                          ),
                          ),

                          SizedBox(height: 40.h,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 108.h,
                              height: 30.h,
                              color: const Color(0xff763aa6),
                              child: const Center(
                                child: AutoSizeText(
                                  'My Posts',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),

                    BorrowCard(),
                    SizedBox(height: 20.h,),
                    GiveawayCard(),
                  ],
                ),
              ),
            ),
          ),
        ),

      ),

    );
  }
}