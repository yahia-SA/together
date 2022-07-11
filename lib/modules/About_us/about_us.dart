// ignore_for_file: deprecated_member_use, unused_import

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/modules/Login_Sign%20up_screen/login/Loginscreen.dart';
import 'package:together/modules/Timeline/HomePage/HomePage.dart';
import 'package:together/shared/components/date.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black), // 1
      ),
      body: Container(
        width: double.infinity.w,
        height: double.infinity.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Color(0xffD8BFD8),
            Color(0xffFFB6C1),
            Color(0xffF8C8DC),
          ]),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 70.h, left: 15.h, right: 15.h),

          //main column
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                //firstPage
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: AutoSizeText(
                        'About Us',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Image.asset(
                      'assets/images/toco.jpg',
                      width: 500.r,
                      height: 200.h,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    const AutoSizeText(
                      'Happiness In Helping!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const AutoSizeText(
                      'TOGETHER',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const AutoSizeText(
                      'Our purpose is to connect people to each other in order to help them find what they want',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(3.h),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: OutlinedButton(
                        onPressed: null,
                        style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                const BorderSide(style: BorderStyle.none))),
                        child: TextButton(
                          onPressed: () {
                            // navgigtor(context, LoginScreen());
                          },
                          child: const AutoSizeText(
                            'login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 30.h,
                ),

                //secondPage
                //white area
                Container(
                  padding: EdgeInsets.all(20.h),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Flexible(
                            child: AutoSizeText(
                              'Our Team',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Flexible(
                            child: AutoSizeText(
                              ' Members',
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        children: [
                          const Flexible(
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/Yomna.jpeg'),
                              radius: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Flexible(
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/Mustafa.jpeg'),
                              radius: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Flexible(
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/Ganna.jpeg'),
                              radius: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Flexible(
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/hellana.jpeg'),
                              radius: 30,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          const Flexible(
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/moemen.jpeg'),
                              radius: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Flexible(
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/yasser.jpeg'),
                              radius: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Flexible(
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/yahia.jpeg'),
                              radius: 30,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/home.png',
                        width: 500.w,
                        height: 300.h,
                      ),
                      Column(
                        children: [
                          const AutoSizeText(
                            'Read More About',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const AutoSizeText(
                            'TOGETHER',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          const AutoSizeText(
                            'In TOGETHER we help you to connect with others to find '
                            'what you need, You can lend, borrow, or donate, as '
                            'you can share your old things to benefit others'
                            'For free or little money.',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const AutoSizeText(
                            'You do not need to worry about security, because we have '
                            'all the data of all users to resist any scam attempts while preserving'
                            'all your rights and personal data.',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Image.asset(
                            'assets/images/give.png',
                            width: 70.w,
                            height: 70.h,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const AutoSizeText(
                            'Giveaway posts',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const AutoSizeText(
                            'Here you can lend or donate something old '
                            'you do not need for free or a little money.',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Image.asset(
                            'assets/images/lend.png',
                            width: 70.w,
                            height: 70.h,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const AutoSizeText(
                            'Lend posts',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const AutoSizeText(
                            'Here you can ask for something , do something'
                            'and wait others to respond your ask to find your need',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          const AutoSizeText(
                            'OUR RULES',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const AutoSizeText(
                            'Sign Up To',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const AutoSizeText(
                            'TOGETHER',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          const AutoSizeText(
                            'First, you have to enter your personal information'
                            'such as name , phone, number, city, address...',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const AutoSizeText(
                            'Second, you have to upload your ID picture '
                            'and your face photo to compare them so you can log in',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          const AutoSizeText(
                            '-Your ID picture should be recent date not old version.',
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const AutoSizeText(
                            '-Your face photo must be less than 30 cm away.',
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const AutoSizeText(
                            '-Your face photo must be without glasses and a hat.',
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Container(
                            padding: EdgeInsets.all(3.h),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: OutlinedButton(
                              onPressed: null,
                              style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                      const BorderSide(
                                          style: BorderStyle.none))),
                              child: TextButton(
                                onPressed: () {
                                  // navgigtor(context, SignUp());
                                },
                                child: const AutoSizeText(
                                  'SIGN UP',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //the last part photo & icons
                SizedBox(
                  height: 30.h,
                ),
                Image.asset(
                  'assets/images/last.jpg',
                  width: 500.w,
                  height: 200.h,
                ),

                SizedBox(
                  height: 30.h,
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
                          launch('https://www.facebook.com/');
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
                          launch("mailto:yomnakerir@gmail.com");
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
                          launch("tel://01098938226");
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
                          launch(
                              "https://www.google.com/maps/dir/30.4196468,31.5619203/suez+canal+university/@30.4303804,31.3553032,9z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x14f8597f201556e7:0x9bd6053867337ff3!2m2!1d32.269729!2d30.620533");
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),

                const AutoSizeText(
                  'Copyright © 2022 TOGETHER. All Rights Reserved.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),

                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
