import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/modules/Timeline/HomePage/Drawer/MyDrawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          backgroundColor: Color.fromARGB(255, 79, 66, 136),
        ),
      ),
    );
  }
}
