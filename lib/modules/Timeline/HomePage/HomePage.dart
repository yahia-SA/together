// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/modules/PostForm/postForm.dart';
import 'package:together/modules/Timeline/HomePage/Drawer/MyDrawer.dart';
import 'package:together/shared/components/date.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        actions: [
          Container(
              color: Colors.white,
              width: 138.h,
              child: Image.asset(
                'assets/images/logowtext.png',
                width: double.infinity,
              )),
        ],
        backgroundColor: const Color(0xFF4c489d),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff4c489d),
        child: Icon(
          Icons.add,
          size: 45.h,
        ),
        onPressed: () {
          navgigtor(context, PostForm());
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
