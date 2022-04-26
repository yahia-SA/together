// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class InfoScreen extends StatelessWidget {
  InfoScreen({Key? key, 
    this.imagePath='https://static.wikia.nocookie.net/bigbangtheory/images/4/4d/Reverb2.jpg',
    this.username = 'Leonard Hofstadter',
    this.city = 'Portsaid',
    this.address = 'Elzohour',
    this.phoneNumber = '+201010101010',
    this.facebook = 'https://www.facebook.com/',
    this.lindekin = 'https://www.linkedin.com/',
    this.twitter = 'https://twitter.com/',
    this.instagram = 'https://www.instagram.com/',

  }) : super(key: key);
  var imagePath;
  var username;
  var city;
  var address;
  var phoneNumber;
  var facebook;
  var lindekin;
  var twitter;
  var instagram;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,

      ),
      body: Container(
        width: double.infinity.r,
        height: double.infinity.h,
        decoration: const BoxDecoration(
          color: Color(0xffc5cae9),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                top: 20.h
              ),
              width: 320.h,
              height: 500.h,
              child: Stack(
                alignment:Alignment.topCenter,
                children: [
          
                  SvgPicture.asset('assets/images/infocard.svg',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    width: double.infinity.h,
                    height: double.infinity.h,
                  ),
          
                  Container(
                    margin: EdgeInsets.only(top: 80.h),
                    child: CircleAvatar(
                      radius: 55.r,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 85.h),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(imagePath),
                    ),
                  ),
          
                  Container(
                    margin: EdgeInsets.only(top: 170.h),
                    child: AutoSizeText(username,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 200.h),
                    width: 80.r,
                    height: 1.h,
                    color: Colors.black,
                  ),
          
                  Container(
                    width: 250.h,
                    height: 160.h,
                    margin: EdgeInsets.only(top: 200.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          const AutoSizeText(
                            'City:',
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                            AutoSizeText(city,
                              style: const TextStyle(
                                  fontSize: 20
                              ),
                            ),
                        ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AutoSizeText(
                              'Address:',
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            ),
                            AutoSizeText(address,
                              style: const TextStyle(
                                  fontSize: 20
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AutoSizeText(
                              'Phone number:',
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            ),
                            Expanded(
                              child: AutoSizeText(phoneNumber,
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                    fontSize: 15
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ),
          
                  Container(
                    width: 250.h,
                    height: 50.h,
                    // color: Colors.green,
                    margin: EdgeInsets.only(top: 420.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: (){},
                          color: Colors.white,
                          icon: const FaIcon(FontAwesomeIcons.facebookF,),
                          iconSize: 35,
                        ),
                        IconButton(
                          onPressed: (){},
                          color: Colors.white,
                          icon: const FaIcon(FontAwesomeIcons.linkedinIn,),
                          iconSize: 35,
                        ),
                        IconButton(
                          onPressed: (){},
                          color: Colors.white,
                          icon: const FaIcon(FontAwesomeIcons.twitter,),
                          iconSize: 35,
                        ),
                        IconButton(
                          onPressed: (){},
                          color: Colors.white,
                          icon: const FaIcon(FontAwesomeIcons.instagram,),
                          iconSize: 35,
                        ),
                      ],
                    ),
                  ),
          
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
