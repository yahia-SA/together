// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:together/modules/Login_Sign%20up_screen/login/Loginscreen.dart';
import 'package:together/shared/components/date.dart';
import 'package:together/shared/network/local/cache_helper.dart';

void signOut(context) {
  showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const AutoSizeText(
          'Do you want to exit this application?,',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff763aa6),
          ),
        ),
        content: const AutoSizeText(
          'We hate to see you leave...',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff763aa6),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(context);
            },
            child: const AutoSizeText(
              'No',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff763aa6),
              ),
            ),
          ),
          TextButton(
            onPressed: ()=>logout(context),
            child: const AutoSizeText(
              'Yes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff763aa6),
              ),
            ),
          ),
        ],
      );
    },
  );
}

void logout(context) {
              CacheHelper.removeData(key: 'iduser');
              CacheHelper.removeData(
                key: 'token',
              ).then((value) {
                if (value) {
                  goToHome(
                    context,
                    LoginScreen(),
                  );
                }
              });
            }

String? token;
String? iduser;
